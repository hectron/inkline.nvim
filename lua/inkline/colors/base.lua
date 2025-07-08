-- Base colors shared across all variants
local M = {}

---@class inkline.Palette
M.base = {
  none           = "NONE",
  white          = "#FFFFFF",
  dark_white     = "#a9cdd6",
  fg             = "#eceef4",
  fg_gutter      = "#2c2f33",
  bg             = "#000000",
  bg_alt         = "#1e2124",
  bg_highlight   = "#3c4048",
  bg_visual      = "#264f78",
  bg_search      = "#4a4a4a",
  dark_grey_1    = "#181a1f",
  dark_grey_2    = "#24272e",
  dark_grey_3    = "#393f4a",
  dark_grey_4    = "#4c566a",
  dark_grey_5    = "#6b6f78", -- slightly lighter than default NvimDarkGrey4
  dark_grey_6    = "#8a8e96",
  grey           = "#7b8496",
  light_grey     = "#9ca0a6",
  black          = "#000000",
  dark_olive     = "#323300",
  dark_blue      = "#00008B",
  blue           = "#4dabf7",
  light_blue     = "#5ea1ff",
  cyan           = "#00ffff",
  dark_cyan      = "#008B8B",
  teal           = "#20b2aa",
  blue_green     = "#00d084",
  blue_green_2   = "#66d9c3",
  green          = "#66FF00",
  light_green    = "#5eff6c",
  red            = "#ff6b6b",
  light_red      = "#ff4f3f",
  orange         = "#ff8c42",
  orange_2       = "#FF8800",
  light_orange   = "#ffbd5e",
  gold_2         = "#ffbb00",
  gold           = "#fcd63a",
  yellow_2       = "#ffdd00",
  yellow         = "#ffd43b",
  purple         = "#A85CF5",
  purple_2       = "#e080ff",
  purple_3       = "#ebb0ff",
  magenta        = "#ff00d0",
  dark_magenta   = "#8B008B",
  pink           = "#ff779b",

  -- Semantic colors for diagnostics and treesitter
  error          = "#e74c3c",
  warning        = "#f39c12",
  info           = "#3498db",
  hint           = "#95a5a6",
  todo           = "#e67e22",

  -- Rainbow colors for markdown headers
  header_1       = "#ff6b6b", -- Red for H1
  header_2       = "#ff8c42", -- Orange for H2
  header_3       = "#ffd43b", -- Yellow for H3
  header_4       = "#51cf66", -- Green for H4
  header_5       = "#4dabf7", -- Blue for H5
  header_6       = "#e080ff", -- Purple for H6

  -- Common colors (these get overridden by variants)
  keyword        = "#e74c3c", -- Red for keywords
  type_color     = "#9b59b6", -- Purple for types
  variable_color = "#ffffff", -- White for variables
  comment_color  = "#7f8c8d", -- Grey for comments
}

return M