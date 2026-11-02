---@class inkline.StyleModule
---@field colors inkline.Palette
---@field syntax "vibrant_ink"|"modern" Syntax group set under inkline.groups
---@field property? string Palette key used for properties in the modern syntax set

local M = {}

---Palette keys computed from other colors and options.
---@param c inkline.Palette
---@param opts inkline.ResolvedConfig
---@param style inkline.StyleModule
---@return table<string, string>
local function derived(c, opts, style)
  return {
    string_color = opts.vibrant_strings and c.green or c.soft_green,
    comment = opts.purple_comments and c.purple or c.dark_grey_5,
    property = style.property and c[style.property] or nil,
  }
end

---Palette for the configured style with options and `on_colors` applied.
---@param opts? inkline.Config
---@return inkline.Palette colors, inkline.ResolvedConfig opts
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  -- Get base colors for the selected style
  local style = require("inkline.colors." .. opts.style) ---@type inkline.StyleModule
  local colors = vim.deepcopy(style.colors)

  -- Apply transparency if enabled
  if opts.transparent then
    colors.bg = colors.none
  end

  local before = derived(colors, opts, style)
  for key, value in pairs(before) do
    colors[key] = value
  end

  if opts.on_colors then
    colors = opts.on_colors(colors) or colors
    -- Follow base colors the callback changed, unless it set the computed key itself
    for key, value in pairs(derived(colors, opts, style)) do
      if colors[key] == before[key] then
        colors[key] = value
      end
    end
  end

  return colors, opts
end

---Terminal colors 0-15 for :terminal buffers.
---@param c inkline.Palette
---@return string[]
function M.terminal(c)
  local Util = require("inkline.util")
  return {
    c.dark_grey_2,
    c.red,
    c.green,
    c.yellow,
    c.light_blue,
    c.purple,
    c.cyan,
    c.fg,
    c.dark_grey_5,
    c.light_red,
    c.light_green,
    c.gold,
    Util.blend_fg(c.light_blue, 0.75),
    c.purple_2,
    Util.blend_fg(c.cyan, 0.75),
    c.white,
  }
end

---@type inkline.Style[]
M.styles = require("inkline.config").styles

return M
