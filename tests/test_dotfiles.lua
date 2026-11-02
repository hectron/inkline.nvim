-- Contract with braintreeps/neovim-dotfiles (lua/plugins/colorscheme.lua, lua/config/utils/colors.lua).
local H = dofile("tests/helpers.lua")
local eq = MiniTest.expect.equality
local child = H.new_child()

local dotfiles_opts = [[{
  transparent = true,
  dim_inactive_windows = false,
  purple_comments = true,
  style = "retro",
  on_highlights = function(hl, c)
    hl["@markup.link"] = { fg = c.yellow }
    return hl
  end,
}]]

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      child.setup()
      H.load(child, dotfiles_opts)
    end,
    post_once = child.stop,
  },
})

T["loads with dotfiles options"] = function()
  eq(child.g.colors_name, "inkline-retro")
  eq(H.hl(child, "Normal", "bg"), vim.NIL)
  eq(H.hl(child, "@markup.link", "fg"), child.lua_get("require('inkline.colors').setup().yellow"):lower())
end

T["heirline groups have colors"] = function()
  local fg = {
    "Folded",
    "DiagnosticError",
    "String",
    "Function",
    "NonText",
    "Keyword",
    "Statement",
    "Special",
    "DiagnosticWarn",
    "DiagnosticHint",
    "DiagnosticInfo",
    "diffAdded",
    "diffChanged",
    "CursorLineNr",
  }
  for _, group in ipairs(fg) do
    MiniTest.expect.no_equality({ group, H.hl(child, group, "fg") }, { group, vim.NIL })
  end
  for _, group in ipairs({ "Folded", "DiffDelete" }) do
    MiniTest.expect.no_equality({ group, H.hl(child, group, "bg") }, { group, vim.NIL })
  end
end

T["lualine theme loads"] = function()
  eq(child.lua_get("type(require('lualine.themes.inkline').normal.a.bg)"), "string")
end

T["snapshot"] = function()
  H.expect_snapshot(H.dump_highlights(child), "dotfiles-retro")
end

return T
