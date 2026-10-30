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

---@type inkline.Style[]
M.styles = require("inkline.config").styles

return M
