-- Dynamic inkline lualine theme
---@class LualineSectionColor
---@field fg string
---@field bg string
---@field gui? string

---@class LualineModeColors
---@field a LualineSectionColor
---@field b? LualineSectionColor
---@field c? LualineSectionColor
---@field x? LualineSectionColor
---@field y? LualineSectionColor
---@field z? LualineSectionColor

---@class LualineTheme
---@field normal LualineModeColors
---@field insert LualineModeColors
---@field visual LualineModeColors
---@field terminal LualineModeColors
---@field replace? LualineModeColors
---@field command? LualineModeColors
local function get_inkline_colors()
  local config = require("inkline.config")
  local current_style = (config.options and config.options.style) or "modern"
  local colors, _ = require("inkline.colors").setup({ style = current_style })
  return colors
end

local colors = get_inkline_colors()

return {
  normal = {
    a = { bg = colors.function_color, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_highlight, fg = colors.function_color },
    c = { bg = colors.bg_alt, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_highlight, fg = colors.green },
  },
  command = {
    a = { bg = colors.constant_color, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_highlight, fg = colors.constant_color },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_highlight, fg = colors.purple },
  },
  terminal = {
    a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_highlight, fg = colors.cyan },
  },
  inactive = {
    a = { bg = colors.bg_alt, fg = colors.dark_grey_5 },
    b = { bg = colors.bg_alt, fg = colors.dark_grey_5 },
    c = { bg = colors.bg_alt, fg = colors.dark_grey_5 },
  },
}

