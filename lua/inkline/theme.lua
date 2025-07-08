-- A theme is composed of colors (palette) and highlight groups.
-- Generally, a theme is defined in colors.
-- A highlight group is built by colors.
local M = {}

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  local colors = require("inkline.colors").setup(opts)

  -- Apply on_colors callback if provided
  if opts.on_colors and type(opts.on_colors) == "function" then
    colors = opts.on_colors(colors) or colors
  end

  local highlights = require("inkline.groups").setup(colors, opts)

  -- Apply on_highlights callback if provided
  if opts.on_highlights and type(opts.on_highlights) == "function" then
    highlights = opts.on_highlights(highlights, colors) or highlights
  end

  return highlights
end

return M
