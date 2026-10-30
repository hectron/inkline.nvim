local eq = MiniTest.expect.equality
local styles = { "original", "retro", "cyberpunk" }

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      vim.cmd("hi clear")
      require("inkline.config").setup({})
    end,
  },
})

local function highlights(style)
  return require("inkline.theme").setup({ style = style, cache = false })
end

T["every style colors the core captures"] = function()
  local captures = { "@variable", "@function", "@keyword", "@string", "@type", "@comment", "@constant", "@property", "@operator" }
  for _, style in ipairs(styles) do
    vim.cmd("hi clear")
    for name, hl in pairs(highlights(style)) do
      vim.api.nvim_set_hl(0, name, type(hl) == "string" and { link = hl } or hl)
    end
    for _, capture in ipairs(captures) do
      local fg = vim.api.nvim_get_hl(0, { name = capture, link = false }).fg
      MiniTest.expect.no_equality({ style, capture, fg }, { style, capture, nil })
    end
  end
end

T["links point at existing groups"] = function()
  for _, style in ipairs(styles) do
    local groups = highlights(style)
    for name, hl in pairs(groups) do
      local target = type(hl) == "string" and hl or hl.link
      if target and not name:find("^DropBar") then
        -- Undefined dotted groups fall back to their parent (@type.definition -> @type)
        local exists, name_ = false, target
        while name_ and not exists do
          exists = groups[name_] ~= nil or not vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = name_ }))
          name_ = name_:match("^(@.+)%.[^.]+$")
        end
        eq({ style, name, target, exists }, { style, name, target, true })
      end
    end
  end
end

T["plugins"] = MiniTest.new_set()

T["plugins"]["are all enabled by default"] = function()
  local groups = highlights("original")
  eq(groups.FlashLabel ~= nil and groups.WhichKey ~= nil, true)
end

T["plugins"]["can be disabled by name"] = function()
  local groups = require("inkline.theme").setup({ plugins = { flash = false } })
  eq(groups.FlashLabel, nil)
  eq(groups.WhichKey ~= nil, true)
end

T["plugins"]["default = false enables only named plugins"] = function()
  local groups = require("inkline.theme").setup({ plugins = { default = false, flash = true } })
  eq(groups.FlashLabel ~= nil, true)
  eq(groups.WhichKey, nil)
end

T["plugins"]["every listed plugin has a module"] = function()
  for _, plugin in ipairs(require("inkline.groups").plugins) do
    eq(type(require("inkline.groups.plugins." .. plugin).get), "function")
  end
end

return T
