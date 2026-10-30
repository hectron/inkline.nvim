local H = {}

function H.new_child()
  local child = MiniTest.new_child_neovim()
  function child.setup()
    child.restart({ "-u", "tests/minimal_init.lua" })
  end
  return child
end

---Load inkline in the child with the given setup() options source and colorscheme name.
---@param child table
---@param opts_src string Lua expression for setup() options
---@param colorscheme? string
function H.load(child, opts_src, colorscheme)
  child.lua(("require('inkline').setup(%s)"):format(opts_src))
  child.cmd("colorscheme " .. (colorscheme or "inkline"))
end

---@return string|nil hex color of a highlight attribute, following links
function H.hl(child, name, attr)
  return child.lua_get(
    [[(function(name, attr)
      local v = vim.api.nvim_get_hl(0, { name = name, link = false })[attr]
      return v and string.format("#%06x", v) or vim.NIL
    end)(...)]],
    { name, attr }
  )
end

---Effective definition of every highlight group, one sorted line per group.
function H.dump_highlights(child)
  return child.lua_get([[(function()
    local seen = {}
    for name in pairs(vim.api.nvim_get_hl(0, {})) do
      seen[name] = true
    end
    -- Captures documented in :h treesitter-highlight-groups resolve through parent fallback
    -- even when inkline does not define them, so include them explicitly.
    local doc = vim.fn.readfile(vim.env.VIMRUNTIME .. "/doc/treesitter.txt")
    for _, line in ipairs(doc) do
      local capture = line:match("^(@[%w_.]+)%s")
      if capture then
        seen[capture] = true
      end
    end
    local names = vim.tbl_keys(seen)
    table.sort(names)
    local lines = {}
    for _, name in ipairs(names) do
      local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
      local parts = { name }
      for _, key in ipairs({ "fg", "bg", "sp" }) do
        if hl[key] then
          parts[#parts + 1] = string.format("%s=#%06x", key, hl[key])
        end
      end
      local attrs = {}
      for key, value in pairs(hl) do
        if value == true then
          attrs[#attrs + 1] = key
        end
      end
      table.sort(attrs)
      vim.list_extend(parts, attrs)
      if #parts > 1 then
        lines[#lines + 1] = table.concat(parts, " ")
      end
    end
    for i = 0, 15 do
      local color = vim.g["terminal_color_" .. i]
      if color then
        lines[#lines + 1] = string.format("terminal_color_%d %s", i, color:lower())
      end
    end
    return lines
  end)()]])
end

local function nvim_version()
  local v = vim.version()
  return string.format("%d.%d", v.major, v.minor)
end

---Compare lines against tests/snapshots/<name>.txt. Set UPDATE_SNAPSHOTS=1 to rewrite.
---Snapshots include Neovim's own default groups, so they only compare on the recorded Neovim minor version.
function H.expect_snapshot(lines, name)
  local path = "tests/snapshots/" .. name .. ".txt"
  local header = "# nvim " .. nvim_version()
  local actual = header .. "\n" .. table.concat(lines, "\n") .. "\n"

  if vim.env.UPDATE_SNAPSHOTS == "1" or vim.fn.filereadable(path) == 0 then
    vim.fn.writefile(vim.split(actual, "\n", { plain = true, trimempty = true }), path)
    MiniTest.add_note("wrote snapshot " .. path)
    return
  end

  local expected = table.concat(vim.fn.readfile(path), "\n") .. "\n"
  local recorded = expected:match("^# nvim (%S+)")
  if recorded ~= nvim_version() then
    MiniTest.skip(("snapshot %s was recorded on nvim %s"):format(path, recorded))
  end

  if expected ~= actual then
    error(("snapshot %s differs (run `make snapshots` to accept):\n%s"):format(path, vim.diff(expected, actual)), 0)
  end
end

return H
