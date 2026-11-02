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

T["colorscheme"]["loads style entrypoint"] = MiniTest.new_set(
  { parametrize = { { "original" }, { "retro" }, { "cyberpunk" } } },
  {
    test = function(style)
      H.load(child, "{}", "inkline-" .. style)
      eq(child.g.colors_name, "inkline-" .. style)
    end,
  }
)

T["colorscheme"]["lists every style as a colorscheme"] = function()
  local names = child.lua_get([[vim.fn.getcompletion("inkline", "color")]])
  local expected = { "inkline" }
  for _, style in ipairs(child.lua_get([[require("inkline").get_styles()]])) do
    table.insert(expected, "inkline-" .. style)
  end
  table.sort(expected)
  eq(names, expected)
end

T["colorscheme"]["works without setup()"] = function()
  child.cmd("colorscheme inkline")
  eq(child.g.colors_name, "inkline-original")
end

T["colorscheme"]["sets background to dark"] = function()
  child.o.background = "light"
  H.load(child, "{}")
  eq(child.o.background, "dark")
end

T["colorscheme"]["turns on termguicolors as in 2.1"] = function()
  child.o.termguicolors = false
  H.load(child, "{}")
  eq(child.o.termguicolors, true)
end

T["colorscheme"]["sets terminal colors"] = function()
  H.load(child, "{}")
  for i = 0, 15 do
    MiniTest.expect.no_equality(child.g["terminal_color_" .. i], vim.NIL)
  end
end

T["colorscheme"]["terminal_colors = false leaves terminal colors alone"] = function()
  H.load(child, "{ terminal_colors = false }")
  eq(child.g.terminal_color_0, vim.NIL)
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
  child.lua("require('inkline').clear_cache()")
  H.load(child, "{ cache = true }")
  eq(child.lua_get("vim.fn.glob(vim.fn.stdpath('cache') .. '/inkline-*', false, true)"), {})
end

T["focus dimming"] = MiniTest.new_set()

local bg = function(group)
  return H.hl(child, group, "bg")
end

T["focus dimming"]["dims Normal and WinBar while Neovim is unfocused"] = function()
  H.load(child, "{ dim_inactive_windows = true }")
  local normal, alt = bg("Normal"), child.lua_get("require('inkline.colors').setup().bg_alt"):lower()
  child.api.nvim_exec_autocmds("FocusLost", {})
  eq({ bg("Normal"), bg("WinBar") }, { alt, alt })
  child.api.nvim_exec_autocmds("FocusGained", {})
  eq(bg("Normal"), normal)
end

T["focus dimming"]["keeps on_highlights overrides when restoring"] = function()
  H.load(
    child,
    "{ dim_inactive_windows = true, on_highlights = function(hl) hl.Normal = { fg = '#123456', bg = '#010101' } end }"
  )
  child.api.nvim_exec_autocmds("FocusLost", {})
  child.api.nvim_exec_autocmds("FocusGained", {})
  eq({ H.hl(child, "Normal", "fg"), bg("Normal") }, { "#123456", "#010101" })
end

T["focus dimming"]["keeps changes made after loading"] = function()
  H.load(child, "{ dim_inactive_windows = true }")
  child.api.nvim_set_hl(0, "Normal", { fg = "#123456", bg = "#010101" })
  child.api.nvim_exec_autocmds("FocusLost", {})
  eq(H.hl(child, "Normal", "fg"), "#123456")
  child.api.nvim_exec_autocmds("FocusGained", {})
  eq({ H.hl(child, "Normal", "fg"), bg("Normal") }, { "#123456", "#010101" })
end

T["focus dimming"]["restores after repeated FocusLost"] = function()
  H.load(child, "{ dim_inactive_windows = true }")
  local normal = bg("Normal")
  child.api.nvim_exec_autocmds("FocusLost", {})
  child.api.nvim_exec_autocmds("FocusLost", {})
  child.api.nvim_exec_autocmds("FocusGained", {})
  eq(bg("Normal"), normal)
end

T["focus dimming"]["stops after switching to another colorscheme"] = function()
  H.load(child, "{ dim_inactive_windows = true }")
  child.cmd("colorscheme default")
  local normal = bg("Normal")
  child.api.nvim_exec_autocmds("FocusLost", {})
  eq(bg("Normal"), normal)
end

T["focus dimming"]["does not pile up autocmds across loads"] = function()
  H.load(child, "{ dim_inactive_windows = true }")
  child.cmd("colorscheme inkline")
  child.cmd("colorscheme inkline-retro")
  eq(child.lua_get("#vim.api.nvim_get_autocmds({ event = 'FocusLost' })"), 1)
end

T["focus dimming"]["needs dim_inactive_windows = true set explicitly, as in 2.1"] = function()
  H.load(child, "{}")
  eq(child.lua_get("#vim.api.nvim_get_autocmds({ event = { 'FocusLost', 'FocusGained' } })"), 0)
end

T["focus dimming"]["is off when dim_inactive_windows = false"] = function()
  H.load(child, "{ dim_inactive_windows = false }")
  eq(child.lua_get("#vim.api.nvim_get_autocmds({ event = { 'FocusLost', 'FocusGained' } })"), 0)
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

T["options"]["vibrant_strings = false softens String"] = MiniTest.new_set(
  { parametrize = { { "original" }, { "retro" } } },
  {
    test = function(style)
      H.load(child, ("{ style = %q, vibrant_strings = false }"):format(style))
      eq(H.hl(child, "String", "fg"), "#27ae60")
      eq(H.hl(child, "@string", "fg"), "#27ae60")
    end,
  }
)

T["options"]["on_highlights overrides groups"] = function()
  H.load(child, "{ on_highlights = function(hl) hl.Comment = { fg = '#123456' } return hl end }")
  eq(H.hl(child, "Comment", "fg"), "#123456")
end

T["lualine"] = MiniTest.new_set()

T["lualine"]["named themes use their own style"] = function()
  H.load(child, "{ style = 'original' }")
  local bg = "require('lualine.themes.inkline-%s').normal.a.bg"
  eq(
    child.lua_get(bg:format("retro")),
    child.lua_get("require('inkline.colors').setup({ style = 'retro' }).function_color")
  )
  eq(
    child.lua_get(bg:format("cyberpunk")),
    child.lua_get("require('inkline.colors').setup({ style = 'cyberpunk' }).function_color")
  )
end

T["lualine"]["inkline theme follows setup() style"] = function()
  H.load(child, "{ style = 'retro' }")
  eq(child.lua_get("require('lualine.themes.inkline').normal.a.bg"), "#5ea1ff")
end

return T
