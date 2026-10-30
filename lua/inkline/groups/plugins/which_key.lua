local M = {}

---@param c table
function M.get(c)
  -- stylua: ignore
  return {
    WhichKey            = { fg = c.yellow, bg = c.bg, bold = true },
    WhichKeyGroup       = { fg = c.teal },
    WhichKeyDesc        = { fg = c.fg },
    WhichKeySeperator   = { fg = c.dark_grey_5 },
    WhichKeySeparator   = { fg = c.dark_grey_5 },
    WhichKeyValue       = { fg = c.green },
    WhichKeyIcon        = { fg = c.yellow },
    WhichKeyIconAzure   = { fg = c.light_blue },
    WhichKeyIconBlue    = { fg = c.blue },
    WhichKeyIconCyan    = { fg = c.cyan },
    WhichKeyIconGreen   = { fg = c.green },
    WhichKeyIconGrey    = { fg = c.grey },
    WhichKeyIconOrange  = { fg = c.orange },
    WhichKeyIconPurple  = { fg = c.purple },
    WhichKeyIconRed     = { fg = c.red },
    WhichKeyIconYellow  = { fg = c.yellow },
    WhichKeyTitle       = { fg = c.yellow, bold = true, bg = c.none },
    WhichKeyBorder      = { fg = c.dark_grey_5, bg = c.none },
    WhichKeyFloatBorder = { fg = c.dark_grey_5, bg = c.none },
    WhichKeyFloatTitle  = { fg = c.yellow, bold = true, bg = c.none },
    WhichKeyFloat       = { bg = c.none },
    WhichKeyNormal      = { bg = c.none },
    WhichKeyWin         = { bg = c.none },
    WhichKeyNormalNC    = { bg = c.none },
    WhichKeyFloatNC     = { bg = c.none },
  }
end

return M
