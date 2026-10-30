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

  -- Set string color based on vibrant_strings option
  if opts.vibrant_strings then
    colors.string_color = colors.green -- #66FF00 (vibrant lime green)
  else
    colors.string_color = "#27ae60"    -- soft forest green (default)
  end

  -- Apply user color overrides
  if opts.on_colors then
    colors = opts.on_colors(colors) or colors
  end

  return colors, opts
end

---@type inkline.Style[]
M.styles = require("inkline.config").styles

return M
