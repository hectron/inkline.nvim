local config = require("inkline.config")
local colors_module = require("inkline.colors")

before_each(function()
  config.setup()
end)

describe("color palette validation", function()
  local required_colors = {
    "bg", "fg", "white", "red", "green", "blue", "yellow", "purple", "cyan",
    "function_color", "variable_color", "constant_color", "keyword", "type_color"
  }

  for _, style in ipairs(colors_module.styles) do
    it("has all required colors for " .. style, function()
      local colors, _ = colors_module.setup({ style = style })

      for _, color_key in ipairs(required_colors) do
        assert(colors[color_key] ~= nil,
          "Missing color '" .. color_key .. "' in " .. style .. " style")
      end
    end)

    it("has valid hex colors for " .. style, function()
      local colors, _ = colors_module.setup({ style = style })

      -- Test key colors are valid hex
      local hex_pattern = "^#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]$"
      assert(colors.function_color:match(hex_pattern) ~= nil,
        "function_color should be valid hex in " .. style)
      assert(colors.constant_color:match(hex_pattern) ~= nil,
        "constant_color should be valid hex in " .. style)
      assert(colors.variable_color:match(hex_pattern) ~= nil,
        "variable_color should be valid hex in " .. style)
    end)
  end
end)

describe("style-specific colors", function()
  it("retro uses pink for properties", function()
    local colors, opts = colors_module.setup({ style = "retro" })
    local property_mapping = require("inkline.colors.property_mapping")
    local prop_color = property_mapping.get_property_color("retro", colors)
    assert(colors.pink == prop_color)
  end)

  it("cyberpunk uses magenta for properties", function()
    local colors, opts = colors_module.setup({ style = "cyberpunk" })
    local property_mapping = require("inkline.colors.property_mapping")
    local prop_color = property_mapping.get_property_color("cyberpunk", colors)
    assert(colors.magenta == prop_color)
  end)
end)

describe("transparency support", function()
  for _, style in ipairs(colors_module.styles) do
    it("applies transparency for " .. style, function()
      local colors, _ = colors_module.setup({ style = style, transparent = true })
      assert(colors.bg == "NONE")
    end)

    it("keeps solid background for " .. style, function()
      local colors, _ = colors_module.setup({ style = style, transparent = false })
      assert(colors.bg == "#000000")
    end)
  end
end)

describe("string color options", function()
  for _, style in ipairs(colors_module.styles) do
    it("uses vibrant strings for " .. style, function()
      local colors, _ = colors_module.setup({ style = style, vibrant_strings = true })
      assert(colors.green == colors.string_color)
    end)

    it("uses soft strings for " .. style, function()
      local colors, _ = colors_module.setup({ style = style, vibrant_strings = false })
      assert(colors.string_color == "#27ae60")
    end)
  end
end)
