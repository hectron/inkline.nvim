local M = {}

---@class inkline.Palette
M.base_colors = {
  none         = "NONE",
  white        = "#FFFFFF",
  dark_white   = "#a9cdd6",
  fg           = "#eceef4",
  fg_gutter    = "#2c2f33",
  bg           = "#000000",
  bg_alt       = "#1e2124",
  bg_highlight = "#3c4048",
  dark_grey_5  = "#6b6f78", -- slightly lighter than default NvimDarkGrey4
  dark_grey_6  = "#8a8e96",
  grey         = "#7b8496",
  black        = "#000000",
  dark_olive   = "#323300",
  dark_blue    = "#00008B",
  blue         = "#0000FF",
  light_blue   = "#5ea1ff",
  cyan         = "#5ef1ff",
  dark_cyan    = "#008B8B",
  teal         = "#4ef2f2",
  blue_green   = "#44fbbe",
  blue_green_2 = "#93ffdd",
  green        = "#66FF00",
  light_green  = "#5eff6c",
  red          = "#FF0000",
  light_red    = "#ff4f3f",
  orange       = "#FF6600",
  orange_2     = "#FF8800",
  light_orange = "#ffbd5e",
  gold_2       = "#ffbb00",
  gold         = "#fcd63a",
  yellow_2     = "#ffdd00",
  yellow       = "#FFFF00",
  purple       = "#A85CF5",
  purple_2     = "#e080ff",
  purple_3     = "#ebb0ff",
  magenta      = "#ff00d0",
  dark_magenta = "#8B008B",
  pink         = "#ff779b",
}

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  local colors = vim.deepcopy(M.base_colors)

  if opts.transparent then
    colors.bg = colors.none
  end

  opts.on_colors(colors)

  return colors, opts
end

return M
