-- Property color mappings for different styles
local M = {}

-- Define property colors for each variant
M.property_colors = {
  classic = function(c) return c.teal end,
  modern = function(c) return c.purple end,
  retro = function(c) return c.pink end,
  cyberpunk = function(c) return c.magenta end,
}

---@param style inkline.Style
---@param colors table
function M.get_property_color(style, colors)
  local mapper = M.property_colors[style]
  if mapper then
    return mapper(colors)
  end
  -- Fallback to modern style
  return M.property_colors.modern(colors)
end

return M