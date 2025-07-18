local M = {}

function M.get(colors, opts)
  -- stylua: ignore
  local groups = {
    Normal                     = { fg = colors.white, bg = colors.bg },
    NormalNC                   = { fg = colors.white, bg = opts.dim_inactive_windows and colors.bg_alt or colors.bg },
    Cursor                     = { fg = colors.black, bg = colors.yellow },
    CursorLine                 = { bg = colors.dark_olive },

    Keyword                    = { fg = colors.light_red },
    Define                     = { fg = colors.light_red },
    Statement                  = { fg = colors.light_red },
    Comment                    = { fg = opts.purple_comments and colors.purple or colors.dark_grey_5, italic = true },
    Type                       = { fg = colors.blue_green },
    Identifier                 = { fg = colors.blue_green },
    Constant                   = { fg = colors.yellow_2 },
    Function                   = { fg = colors.gold_2 },
    Include                    = { fg = colors.gold },
    String                     = { fg = colors.green },
    Search                     = { bg = colors.light_blue, fg = colors.black },
    CurSearch                  = { bg = colors.light_orange, fg = colors.black },
    Special                    = { fg = colors.teal },
    Delimiter                  = { fg = colors.blue_green_2 },
    rubySymbol                 = { fg = colors.teal },
    rubyPseudoVariable         = { fg = colors.teal },
    rubyStringDelimiter        = { fg = colors.green },
    rubyInterpolation          = { fg = colors.white },
    MatchParen                 = { fg = colors.green, bold = true },
    StatusLine                 = { bg = colors.none },
    CursorLineNr               = { fg = colors.light_orange, bold = true },
    PmenuSel                   = { bg = colors.bg_highlight, reverse = false, underline = false },
    Visual                     = { bg = colors.bg_highlight },
    WinBar                     = { fg = colors.white, bold = false },

    -- Diff Highlights
    DiffAdd                    = { fg = colors.green, bg = colors.dark_grey_1 },
    DiffChange                 = { fg = colors.yellow, bg = colors.dark_grey_1 },
    DiffDelete                 = { fg = colors.red, bg = colors.dark_grey_1, bold = true },
    DiffText                   = { fg = colors.orange, bg = colors.dark_grey_2, bold = true },

    -- Git commit message highlights
    diffAdded                  = { fg = colors.green, bold = true },
    diffRemoved                = { fg = colors.red, bold = true },
    diffChanged                = { fg = colors.yellow, bold = true },
    diffLine                   = { fg = colors.cyan, bold = true },
    diffSubname                = { fg = colors.purple, italic = true },
    diffFile                   = { fg = colors.light_blue, bold = true },
    diffNewFile                = { fg = colors.green, bold = true },
    diffOldFile                = { fg = colors.red, bold = true },

    -- Git commit message specific highlights
    gitcommitSummary           = { fg = colors.light_blue, bold = true, underline = true },
    gitcommitOverflow          = { fg = colors.red, bold = true, reverse = true },
    gitcommitComment           = { fg = opts.purple_comments and colors.purple or colors.dark_grey_5, italic = true },
    gitcommitUntracked         = { fg = colors.dark_grey_5 },
    gitcommitDiscarded         = { fg = colors.red },
    gitcommitSelected          = { fg = colors.green },
    gitcommitUnmerged          = { fg = colors.yellow },
    gitcommitOnBranch          = { fg = colors.cyan },
    gitcommitBranch            = { fg = colors.purple, bold = true },
    gitcommitNoBranch          = { fg = colors.red, bold = true },
    gitcommitHeader            = { fg = colors.light_blue, bold = true },
    gitcommitFirst             = { fg = colors.light_blue, bold = true, underline = true },

    SignColumn                 = {}, -- clears it

    DiagnosticUnnecessary      = { fg = colors.grey, italic = true },

    -- GitSigns
    Added                      = { fg = colors.green },
    Changed                    = { fg = colors.teal },
    Removed                    = { fg = colors.red },
    GitSignsCurrentLineBlame   = { fg = colors.dark_grey_5 },

    -- Dropbar
    DropBarIconUISeparator     = { link = "DropBarIconKindSection", bold = false },
    DropBarIconUISeparatorNC   = { link = "DropBarIconKindSectionNC" },
    DropBarIconKindFolderNC    = { link = "DropBarIconKindFolder" },
    DropBarIconUIPickPivot     = { fg = colors.red },
    DropBarMenuHoverSymbol     = { bold = true },
    DropBarMenuHoverEntry      = { bg = colors.dark_olive },
    DropBarMenuFloatBorder     = { bg = colors.white },
    DropBarMenuHoverIcon       = { reverse = false },
    DropBarCurrentContext      = { bold = true },
    DropBarCurrentContextName  = { bold = true, fg = colors.white },
    DropBarIconUISeparatorMenu = { bold = false },

    -- Copilot
    CopilotSuggestion          = { fg = colors.dark_grey_6, italic = true },
    CopilotAnnotation          = { link = "CopilotSuggestion" },

    -- Which-Key
    WhichKey                   = { fg = colors.cyan, bold = true },
    WhichKeyGroup              = { fg = colors.purple, bold = true },
    WhichKeyDesc               = { fg = colors.light_blue },
    WhichKeySeperator          = { fg = colors.dark_grey_5 },
    WhichKeySeparator          = { fg = colors.dark_grey_5 },
    WhichKeyFloat              = { bg = colors.none },
    WhichKeyBorder             = { fg = colors.dark_grey_5, bg = colors.none },
    WhichKeyNormal             = { bg = colors.none },
    WhichKeyValue              = { fg = colors.green },
    WhichKeyIcon               = { fg = colors.yellow },
    WhichKeyIconAzure          = { fg = colors.light_blue },
    WhichKeyIconBlue           = { fg = colors.blue },
    WhichKeyIconCyan           = { fg = colors.cyan },
    WhichKeyIconGreen          = { fg = colors.green },
    WhichKeyIconGrey           = { fg = colors.grey },
    WhichKeyIconOrange         = { fg = colors.orange },
    WhichKeyIconPurple         = { fg = colors.purple },
    WhichKeyIconRed            = { fg = colors.red },
    WhichKeyIconYellow         = { fg = colors.yellow },

    -- Additional which-key highlights that might override
    WhichKeyTitle              = { fg = colors.yellow, bold = true, bg = colors.none },
    WhichKeyFloatBorder        = { fg = colors.dark_grey_5, bg = colors.none },
    WhichKeyFloatTitle         = { fg = colors.yellow, bold = true, bg = colors.none },

    -- Float window highlights that which-key might inherit from
    NormalFloat                = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg_alt },
    FloatBorder                = { fg = colors.dark_grey_5, bg = opts.transparent and colors.none or colors.bg_alt },
    FloatTitle                 = { fg = colors.yellow, bold = true, bg = opts.transparent and colors.none or colors.bg_alt },

    -- Which-key v3 specific highlights (force transparent for which-key)
    WhichKeyWin                = { bg = colors.none },
    WhichKeyNormalNC           = { bg = colors.none },
    WhichKeyFloatNC            = { bg = colors.none },

    -- Flash
    FlashMatch                 = { fg = colors.light_blue, bg = colors.bg, bold = true },
    FlashLabel                 = { fg = colors.yellow, bg = colors.bg, bold = true },
  }
	if opts.dim_inactive_windows then
		groups.WinBarNC = { fg = colors.dark_grey_6, bg = colors.bg_alt }
	end

	return groups
end

return M
