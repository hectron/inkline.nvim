local H = dofile("tests/helpers.lua")
local eq = MiniTest.expect.equality
local child = H.new_child()

local T = MiniTest.new_set({
  hooks = {
    pre_case = child.setup,
    post_once = child.stop,
  },
})

T["colorscheme"] = MiniTest.new_set()

T["colorscheme"]["defaults to original"] = function()
  H.load(child, "{}")
  eq(child.g.colors_name, "inkline-original")
end

T["colorscheme"]["loads configured style"] = MiniTest.new_set({ parametrize = { { "retro" }, { "cyberpunk" } } }, {
  test = function(style)
    H.load(child, ("{ style = %q }"):format(style))
    eq(child.g.colors_name, "inkline-" .. style)
  end,
})

T["colorscheme"]["loads style entrypoint"] = MiniTest.new_set({ parametrize = { { "original" }, { "retro" }, { "cyberpunk" } } }, {
  test = function(style)
    H.load(child, "{}", "inkline-" .. style)
    eq(child.g.colors_name, "inkline-" .. style)
  end,
})

T["colorscheme"]["works without setup()"] = function()
  child.cmd("colorscheme inkline")
  eq(child.g.colors_name, "inkline-original")
end

T["colorscheme"]["sets background to dark"] = function()
  child.o.background = "light"
  H.load(child, "{}")
  eq(child.o.background, "dark")
end

T["colorscheme"]["leaves termguicolors alone"] = function()
  child.o.termguicolors = false
  H.load(child, "{}")
  eq(child.o.termguicolors, false)
end

T["colorscheme"]["sets terminal colors"] = function()
  H.load(child, "{}")
  for i = 0, 15 do
    MiniTest.expect.no_equality(child.g["terminal_color_" .. i], vim.NIL)
  end
end

T["colorscheme"]["falls back to original for an unknown style"] = function()
  H.load(child, "{ style = 'cypberpunk' }")
  eq(child.g.colors_name, "inkline-original")
end

T["setup"] = MiniTest.new_set()

T["setup"]["works without arguments"] = function()
  child.lua("require('inkline').setup()")
  child.cmd("colorscheme inkline")
  eq(child.g.colors_name, "inkline-original")
end

T["setup"]["creates no autocmds"] = function()
  local count = "#vim.api.nvim_get_autocmds({ event = { 'BufEnter', 'FocusLost', 'FocusGained' } })"
  local before = child.lua_get(count)
  child.lua("require('inkline').setup({ dim_inactive_windows = true })")
  child.lua("require('inkline').setup({ dim_inactive_windows = true })")
  eq(child.lua_get(count), before)
end

T["setup"]["calls on_colors once per load"] = function()
  H.load(child, "{ on_colors = function(c) _G.calls = (_G.calls or 0) + 1 return c end }")
  eq(child.lua_get("_G.calls"), 1)
end

T["setup"]["cache option writes nothing"] = function()
  child.lua("vim.fn.mkdir(vim.fn.stdpath('cache'), 'p')")
  H.load(child, "{ cache = true }")
  eq(child.lua_get("vim.fn.glob(vim.fn.stdpath('cache') .. '/inkline-*', false, true)"), {})
end

T["switch_style"] = MiniTest.new_set()

T["switch_style"]["fires ColorScheme"] = function()
  H.load(child, "{}")
  child.lua("vim.api.nvim_create_autocmd('ColorScheme', { callback = function() _G.fired = true end })")
  child.lua("require('inkline').switch_style('retro')")
  eq(child.lua_get("_G.fired"), true)
end

T["switch_style"]["switches styles"] = function()
  H.load(child, "{ style = 'cyberpunk' }")
  child.lua("require('inkline').switch_style('retro')")
  eq(child.g.colors_name, "inkline-retro")
end

T["switch_style"]["rejects unknown style"] = function()
  H.load(child, "{}")
  child.lua("require('inkline').switch_style('invalid')")
  eq(child.g.colors_name, "inkline-original")
end

T["options"] = MiniTest.new_set()

T["options"]["transparent clears Normal bg"] = function()
  H.load(child, "{ transparent = true }")
  eq(H.hl(child, "Normal", "bg"), vim.NIL)
end

T["options"]["purple_comments colors comments"] = function()
  H.load(child, "{ purple_comments = true }")
  eq(H.hl(child, "Comment", "fg"), "#a85cf5")
end

T["options"]["vibrant_strings = false softens String"] = MiniTest.new_set({ parametrize = { { "original" }, { "retro" } } }, {
  test = function(style)
    H.load(child, ("{ style = %q, vibrant_strings = false }"):format(style))
    eq(H.hl(child, "String", "fg"), "#27ae60")
    eq(H.hl(child, "@string", "fg"), "#27ae60")
  end,
})

T["options"]["on_highlights overrides groups"] = function()
  H.load(child, "{ on_highlights = function(hl) hl.Comment = { fg = '#123456' } return hl end }")
  eq(H.hl(child, "Comment", "fg"), "#123456")
end

return T
