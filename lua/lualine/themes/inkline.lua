local M = {}

function M.get()
  local colors, config = require("inkline.colors").setup({})

  ---@type LualineTheme
  local hl = {}

  hl.normal = {
    a = { fg = colors.black, bg = colors.orange },
    b = { fg = colors.orange, bg = colors.fg_gutter },
    c = { fg = colors.fg, bg = colors.bg },
    x = { fg = colors.fg, bg = colors.bg },
    y = { fg = colors.orange, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.orange },
  }

  hl.insert = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.green, bg = colors.fg_gutter },
    y = { fg = colors.green, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.green },
  }

  hl.command = {
    a = { fg = colors.black, bg = colors.gold },
    b = { fg = colors.gold, bg = colors.fg_gutter },
    y = { fg = colors.gold, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.gold },
  }

  hl.visual = {
    a = { fg = colors.black, bg = colors.magenta },
    b = { fg = colors.magenta, bg = colors.fg_gutter },
    y = { fg = colors.magenta, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.magenta },
  }

  hl.terminal = {
    a = { fg = colors.black, bg = colors.teal },
    b = { fg = colors.teal, bg = colors.fg_gutter },
    y = { fg = colors.teal, bg = colors.fg_gutter },
    z = { fg = colors.black, bg = colors.teal },
  }

  return hl
end

return M.get()
