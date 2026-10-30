local M = {}

---@param c table
---@param opts inkline.ResolvedConfig
function M.get(c, opts)
  local float_bg = opts.transparent and c.none or c.bg

  -- stylua: ignore
  local groups = {
    Normal                     = { fg = c.white, bg = c.bg },
    NormalNC                   = { fg = c.white, bg = opts.dim_inactive_windows and c.bg_alt or c.bg },
    Cursor                     = { fg = c.black, bg = c.yellow },
    CursorLine                 = { bg = c.dark_olive },
    CursorLineNr               = { fg = c.light_orange, bold = true },
    LineNr                     = { fg = c.dark_grey_5 },
    SignColumn                 = {},
    StatusLine                 = { bg = c.none },
    WinBar                     = { fg = c.white, bold = false },
    Search                     = { bg = c.light_blue, fg = c.black },
    CurSearch                  = { bg = c.light_orange, fg = c.black },
    MatchParen                 = { fg = c.green, bold = true },
    Visual                     = { bg = c.bg_highlight },
    PmenuSel                   = { bg = c.bg_highlight, reverse = false, underline = false },

    NormalFloat                = { fg = c.fg, bg = float_bg },
    FloatBorder                = { fg = c.dark_grey_5, bg = c.none },
    FloatTitle                 = { fg = c.yellow, bold = true, bg = c.none },

    DiffAdd                    = { bg = c.dark_green },
    DiffChange                 = { bg = c.dark_teal },
    DiffDelete                 = { fg = c.white, bg = c.dark_red },
    DiffText                   = { bg = c.dark_teal_2 },
    Added                      = { fg = c.green },
    Changed                    = { fg = c.teal },
    Removed                    = { fg = c.red },

    LspReferenceText           = { bg = c.bg_visual },
    LspReferenceRead           = { bg = c.bg_visual },
    LspReferenceWrite          = { bg = c.bg_visual },

    DiagnosticError            = { fg = c.red },
    DiagnosticWarn             = { fg = c.orange },
    DiagnosticInfo             = { fg = c.light_blue },
    DiagnosticHint             = { fg = c.teal },
    DiagnosticUnnecessary      = { fg = c.grey, italic = true },

    -- Plugins
    GitSignsAdd                = { fg = c.green },
    GitSignsAddInline          = { bg = c.dark_green_2, fg = c.white },
    GitSignsChange             = { fg = c.teal },
    GitSignsChangeInline       = { bg = c.dark_green_2, fg = c.white },
    GitSignsDelete             = { fg = c.red },
    GitSignsDeleteInline       = { bg = c.dark_red_2, fg = c.white },
    GitSignsCurrentLineBlame   = { fg = c.dark_grey_5 },

    TelescopeNormal            = { fg = c.white, bg = c.bg },
    TelescopeSelection         = { fg = c.white, bg = c.bg_highlight },

    TreesitterContext          = { fg = c.grey, bg = c.bg },
    TreesitterContextBottom    = { sp = c.dark_grey_4, underline = true },

    CmpItemKind                = { fg = c.purple },
    CmpItemAbbrMatch           = { fg = c.light_blue },
    CmpItemAbbrMatchFuzzy      = { fg = c.light_blue },

    NoiceCmdlineIcon           = { fg = c.gold },
    NoiceCmdlinePopupBorder    = { fg = c.gold },
    NoiceCmdlineIconSearch     = { fg = c.light_blue },
    NoiceCmdlinePopupBorderSearch = { fg = c.light_blue },

    FlashMatch                 = { fg = c.light_blue, bg = c.bg, bold = true },
    FlashLabel                 = { fg = c.yellow, bg = c.bg, bold = true },

    CopilotSuggestion          = { fg = c.dark_grey_6, italic = true },
    CopilotAnnotation          = "CopilotSuggestion",

    DropBarIconUISeparator     = { link = "DropBarIconKindSection", bold = false },
    DropBarIconUISeparatorNC   = "DropBarIconKindSectionNC",
    DropBarIconKindFolderNC    = "DropBarIconKindFolder",
    DropBarIconUIPickPivot     = { fg = c.red },
    DropBarMenuHoverSymbol     = { bold = true },
    DropBarMenuHoverEntry      = { bg = c.dark_olive },
    DropBarMenuFloatBorder     = { bg = c.white },
    DropBarMenuHoverIcon       = "DropBarMenuHoverEntry",
    DropBarCurrentContext      = { bold = true },
    DropBarCurrentContextName  = { bold = true, fg = c.white },
    DropBarIconUISeparatorMenu = "NormalFloat",

    WhichKey                   = { fg = c.yellow, bg = c.bg, bold = true },
    WhichKeyGroup              = { fg = c.teal },
    WhichKeyDesc               = { fg = c.fg },
    WhichKeySeperator          = { fg = c.dark_grey_5 },
    WhichKeySeparator          = { fg = c.dark_grey_5 },
    WhichKeyValue              = { fg = c.green },
    WhichKeyIcon               = { fg = c.yellow },
    WhichKeyIconAzure          = { fg = c.light_blue },
    WhichKeyIconBlue           = { fg = c.blue },
    WhichKeyIconCyan           = { fg = c.cyan },
    WhichKeyIconGreen          = { fg = c.green },
    WhichKeyIconGrey           = { fg = c.grey },
    WhichKeyIconOrange         = { fg = c.orange },
    WhichKeyIconPurple         = { fg = c.purple },
    WhichKeyIconRed            = { fg = c.red },
    WhichKeyIconYellow         = { fg = c.yellow },
    WhichKeyTitle              = { fg = c.yellow, bold = true, bg = c.none },
    WhichKeyBorder             = { fg = c.dark_grey_5, bg = c.none },
    WhichKeyFloatBorder        = { fg = c.dark_grey_5, bg = c.none },
    WhichKeyFloatTitle         = { fg = c.yellow, bold = true, bg = c.none },
    WhichKeyFloat              = { bg = c.none },
    WhichKeyNormal             = { bg = c.none },
    WhichKeyWin                = { bg = c.none },
    WhichKeyNormalNC           = { bg = c.none },
    WhichKeyFloatNC            = { bg = c.none },
  }

  if opts.dim_inactive_windows then
    groups.WinBarNC = { fg = c.dark_grey_6, bg = c.bg_alt }
  end

  return groups
end

return M
