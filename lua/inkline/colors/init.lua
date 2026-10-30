local M = {}

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  -- Get base colors for the selected style
  local colors = vim.deepcopy(require("inkline.colors." .. opts.style).colors)

  -- Apply transparency if enabled
  if opts.transparent then
    colors.bg = colors.none
  end

  colors.string_color = opts.vibrant_strings and colors.green or colors.soft_green
  colors.comment = opts.purple_comments and colors.purple or colors.dark_grey_5

  -- Apply user color overrides
  if opts.on_colors then
    colors = opts.on_colors(colors) or colors
  end

  return colors, opts
end

---Terminal colors 0-15 for :terminal buffers.
---@param c table palette from setup()
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
