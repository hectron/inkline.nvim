local M = {}

---@class inkline.Palette
M.base_colors = {
  none         = "NONE",
  bg           = "#000000",
  bg_alt       = "#1e2124",
  bg_highlight = "#3c4048",
  dark_grey_5  = "#6b6f78", -- slightly lighter than default NvimDarkGrey4
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
  fg           = "#ffffff",
  fg_gutter    = "#2c2f33",
  grey         = "#7b8496",
  light_blue   = "#5ea1ff",
  light_green  = "#5eff6c",
  cyan         = "#5ef1ff",
  light_red    = "#ff6e5e",
  light_yellow = "#f1ff5e",
  magenta      = "#ff5ef1",
  pink         = "#ff5ea0",
  light_orange = "#ffbd5e",
  light_purple = "#bd5eff",
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
