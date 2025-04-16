local M = {}

---@class inkline.Palette
M.base_colors = {
  none         = "NONE",
  bg           = "#000000",
  black        = "#000000",
  blue         = "#0000FF",
  dark_blue    = "#00008B",
  dark_cyan    = "#008B8B",
  dark_magenta = "#8B008B",
  gold         = "#FFCC00",
  green        = "#66FF00",
  dark_olive   = "#323300",
  orange       = "#FF6600",
  purple       = "#9933CC",
  red          = "#FF0000",
  teal         = "#339999",
  white        = "#FFFFFF",
  yellow       = "#FFFF00",
  pale_yellow  = "#FFEE98",
}

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  local colors = vim.deepcopy(M.base_colors)

  if opts.transparent then
    colors.bg = colors.none
  end

  return colors, opts
end

return M
