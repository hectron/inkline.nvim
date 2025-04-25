local M = {}

function M.get()
  local colors, config = require("inkline.colors").setup({})

  ---@type LualineTheme
  local hl = {}

  hl.normal = {
    a = { fg = colors.orange, bg = colors.bg },
    b = { fg = colors.cyan, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
    x = { fg = colors.fg, bg = colors.bg },
    y = { fg = colors.cyan, bg = colors.bg },
    z = { fg = colors.grey, bg = colors.bg },
  }

  hl.insert = {
    a = { fg = colors.green, bg = colors.bg },
    z = { fg = colors.grey, bg = colors.bg },
  }

  hl.visual = {
    a = { fg = colors.magenta, bg = colors.bg },
    z = { fg = colors.grey, bg = colors.bg },
  }

  hl.terminal = {
    a = { fg = colors.orange, bg = colors.bg },
    z = { fg = colors.grey, bg = colors.bg },
  }

  return hl
end

return M.get()
