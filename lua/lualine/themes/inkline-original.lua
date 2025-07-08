-- Original variant lualine theme (matches main branch exactly)
local function get_inkline_colors()
  local colors, _ = require("inkline.colors").setup({ style = "original" })
  return colors
end

local colors = get_inkline_colors()

return {
  normal = {
    a = { fg = colors.black, bg = colors.orange },
    b = { fg = colors.orange, bg = colors.fg_gutter },
    c = { fg = colors.fg, bg = colors.bg },
    x = { fg = colors.fg, bg = colors.bg },
    y = { fg = colors.orange, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.orange },
  },
  insert = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.green, bg = colors.fg_gutter },
    y = { fg = colors.green, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.green },
  },
  command = {
    a = { fg = colors.black, bg = colors.gold },
    b = { fg = colors.gold, bg = colors.fg_gutter },
    y = { fg = colors.gold, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.gold },
  },
  visual = {
    a = { fg = colors.black, bg = colors.magenta },
    b = { fg = colors.magenta, bg = colors.fg_gutter },
    y = { fg = colors.magenta, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.magenta },
  },
  terminal = {
    a = { fg = colors.black, bg = colors.teal },
    b = { fg = colors.teal, bg = colors.fg_gutter },
    y = { fg = colors.teal, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.teal },
  },
  inactive = {
    a = { fg = colors.dark_grey_5, bg = colors.bg_alt },
    b = { fg = colors.dark_grey_5, bg = colors.bg_alt },
    c = { fg = colors.dark_grey_5, bg = colors.bg_alt },
  },
}

