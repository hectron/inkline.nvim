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

T["colorscheme"]["loads style entrypoint"] = MiniTest.new_set({ parametrize = { { "original" }, { "retro" } } }, {
  test = function(style)
    H.load(child, "{}", "inkline-" .. style)
    eq(child.g.colors_name, "inkline-" .. style)
  end,
})

T["switch_style"] = MiniTest.new_set()

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

T["options"]["on_highlights overrides groups"] = function()
  H.load(child, "{ on_highlights = function(hl) hl.Comment = { fg = '#123456' } return hl end }")
  eq(H.hl(child, "Comment", "fg"), "#123456")
end

return T
