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

T["every style defines the same groups"] = function()
  local reference = vim.tbl_keys(highlights("original"))
  table.sort(reference)
  for _, style in ipairs(styles) do
    local names = vim.tbl_keys(highlights(style))
    table.sort(names)
    eq({ style, names }, { style, reference })
  end
end

T["links point at existing groups"] = function()
  for _, style in ipairs(styles) do
    local groups = highlights(style)
    for name, hl in pairs(groups) do
      local target = type(hl) == "string" and hl or hl.link
      if target and not name:find("^DropBar") then
        local exists = groups[target] ~= nil or not vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = target }))
        eq({ style, name, target, exists }, { style, name, target, true })
      end
    end
  end
end

return T
