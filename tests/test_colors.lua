local eq = MiniTest.expect.equality
local colors = require("inkline.colors")

local T = MiniTest.new_set({
  hooks = {
    pre_case = function()
      require("inkline.config").setup({})
    end,
  },
})

local required = {
  "bg",
  "fg",
  "white",
  "red",
  "green",
  "blue",
  "yellow",
  "purple",
  "cyan",
  "function_color",
  "variable_color",
  "constant_color",
  "keyword",
  "type_color",
}

T["palette"] = MiniTest.new_set({ parametrize = { { "original" }, { "retro" }, { "cyberpunk" } } })

T["palette"]["has required colors"] = function(style)
  local c = colors.setup({ style = style })
  for _, key in ipairs(required) do
    MiniTest.expect.no_equality(c[key], nil)
  end
end

T["palette"]["uses valid hex colors"] = function(style)
  local c = colors.setup({ style = style })
  for key, value in pairs(c) do
    if value ~= "NONE" then
      eq({ key, value:match("^#%x%x%x%x%x%x$") ~= nil }, { key, true })
    end
  end
end

T["palette"]["transparent clears bg"] = function(style)
  eq(colors.setup({ style = style, transparent = true }).bg, "NONE")
  eq(colors.setup({ style = style, transparent = false }).bg, "#000000")
end

T["palette"]["vibrant_strings picks string color"] = function(style)
  local vibrant = colors.setup({ style = style, vibrant_strings = true })
  eq(vibrant.string_color, vibrant.green)
  eq(colors.setup({ style = style, vibrant_strings = false }).string_color, "#27ae60")
end

return T
