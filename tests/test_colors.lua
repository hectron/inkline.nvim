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

T["on_colors"] = MiniTest.new_set()

T["on_colors"]["base color changes reach computed colors"] = function()
  local c = colors.setup({
    style = "retro",
    purple_comments = true,
    on_colors = function(c)
      c.pink = "#111111"
      c.purple = "#222222"
      c.green = "#333333"
    end,
  })
  eq({ c.property, c.comment, c.string_color }, { "#111111", "#222222", "#333333" })
end

T["on_colors"]["computed colors set directly win"] = function()
  local c = colors.setup({
    on_colors = function(c)
      c.comment = "#444444"
      c.dark_grey_5 = "#555555"
    end,
  })
  eq(c.comment, "#444444")
end

T["on_colors"]["can return a new table"] = function()
  local c = colors.setup({
    on_colors = function(c)
      return vim.tbl_extend("force", c, { green = "#666666" })
    end,
  })
  eq(c.string_color, "#666666")
end

return T
