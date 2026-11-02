local M = {}

---Lualine theme built from a style's palette.
---@param style? inkline.Style defaults to the style from setup()
---@return table<string, table<string, {fg: string, bg: string, gui?: string}>>
function M.theme(style)
  local colors = require("inkline.colors").setup(style and { style = style } or nil)

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
end

return M
