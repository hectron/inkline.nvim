-- Original variant base highlights (from main branch)
local Util = require("inkline.util")

local M = {}

function M.get(colors, opts)
  -- stylua: ignore
  local groups = {
    Normal                  = { fg = colors.white, bg = colors.bg },
    NormalNC                = { fg = colors.white, bg = opts.dim_inactive_windows and colors.bg_alt or colors.bg },
    Cursor                  = { fg = colors.black, bg = colors.yellow },
    CursorLine              = { bg = colors.dark_olive },

    Keyword                 = { fg = colors.light_red },
    Define                  = { fg = colors.light_red },
    Statement               = { fg = colors.light_red },
    Comment                 = { fg = opts.purple_comments and colors.purple or colors.dark_grey_5, italic = true },
    Type                    = { fg = colors.blue_green },
    Identifier              = { fg = colors.blue_green },
    Constant                = { fg = colors.yellow_2 },
    Function                = { fg = colors.gold_2 },
    Include                 = { fg = colors.gold },
    String                  = { fg = colors.green },
    Search                  = { bg = colors.light_blue, fg = colors.black },
    CurSearch               = { bg = colors.light_orange, fg = colors.black },
    Special                 = { fg = colors.teal },
    Delimiter               = { fg = colors.blue_green_2 },
    rubySymbol              = { fg = colors.teal },
    rubyPseudoVariable      = { fg = colors.teal },
    rubyStringDelimiter     = { fg = colors.green },
    rubyInterpolation       = { fg = colors.white },
    MatchParen              = { fg = colors.green, bold = true },
    StatusLine              = { bg = colors.none },
    CursorLineNr            = { fg = colors.light_orange, bold = true },
    PmenuSel                = { bg = colors.bg_highlight, reverse = false, underline = false },
    Visual                  = { bg = colors.bg_highlight },
    WinBar                  = { fg = colors.white, bold = false },

    -- Diff Highlights
    DiffAdd                 = { bg = colors.dark_green },
    DiffChange              = { bg = colors.dark_teal },
    DiffDelete              = { fg = colors.white, bg = colors.dark_red },
    DiffText                = { bg = colors.dark_teal_2 },

    -- Links
    diffAdded               = { link = "String" },
    diffRemoved             = { link = "Statement" },
    diffLine                = { link = "PreProc" },
    diffSubname             = { link = "Comment" },
    SignColumn              = {}, -- clears it

    -- Gitsigns
    GitSignsAdd             = { fg = colors.green },
    GitSignsAddInline       = { bg = colors.dark_green_2, fg = colors.white },
    GitSignsChange          = { fg = colors.teal },
    GitSignsChangeInline    = { bg = colors.dark_green_2, fg = colors.white },
    GitSignsDelete          = { fg = colors.red },
    GitSignsDeleteInline    = { bg = colors.dark_red_2, fg = colors.white },

    -- Line Numbers
    LineNr                  = { fg = colors.dark_grey_5 },

    -- Telescope
    TelescopeNormal         = { fg = colors.white, bg = colors.bg },
    TelescopeSelection      = { fg = colors.white, bg = colors.bg_highlight },

    -- Tree-sitter context
    TreesitterContext       = { fg = colors.grey, bg = colors.bg },
    TreesitterContextBottom = { sp = colors.dark_grey_4, underline = true },

    -- Completions
    CmpItemKind             = { fg = colors.purple },
    CmpItemAbbrMatch        = { fg = colors.light_blue },
    CmpItemAbbrMatchFuzzy   = { fg = colors.light_blue },

    -- LSP
    LspReferenceText        = { bg = colors.bg_visual },
    LspReferenceRead        = { bg = colors.bg_visual },
    LspReferenceWrite       = { bg = colors.bg_visual },

    -- Diagnostics
    DiagnosticError         = { fg = colors.red },
    DiagnosticWarn          = { fg = colors.orange },
    DiagnosticInfo          = { fg = colors.light_blue },
    DiagnosticHint          = { fg = colors.teal },

    -- Float window highlights that which-key might inherit from
    NormalFloat                = { fg = colors.fg, bg = opts.transparent and colors.none or colors.bg },
    FloatBorder                = { fg = colors.dark_grey_5, bg = colors.none },
    FloatTitle                 = { fg = colors.yellow, bold = true, bg = colors.none },

    -- Which-key
    WhichKey                   = { fg = colors.yellow, bg = colors.bg, bold = true },
    WhichKeyGroup              = { fg = colors.teal },
    WhichKeyDesc               = { fg = colors.fg },
    WhichKeySeperator          = { fg = colors.dark_grey_5 },
    WhichKeyIconAzure          = { fg = colors.light_blue },
    WhichKeyIconBlue           = { fg = colors.blue },
    WhichKeyIconCyan           = { fg = colors.cyan },
    WhichKeyIconGreen          = { fg = colors.green },
    WhichKeyIconGrey           = { fg = colors.grey },
    WhichKeyIconOrange         = { fg = colors.orange },
    WhichKeyIconPurple         = { fg = colors.purple },
    WhichKeyIconRed            = { fg = colors.red },
    WhichKeyIconYellow         = { fg = colors.yellow },

    -- Git commit
    gitcommitOverflow       = { fg = colors.red },
    gitcommitSummary        = { fg = colors.blue },
    gitcommitComment        = { fg = colors.dark_grey_5 },
    gitcommitUntracked      = { fg = colors.dark_grey_5 },
    gitcommitDiscarded      = { fg = colors.dark_grey_5 },
    gitcommitSelected       = { fg = colors.dark_grey_5 },
    gitcommitHeader         = { fg = colors.purple },
    gitcommitSelectedType   = { fg = colors.blue },
    gitcommitUnmergedType   = { fg = colors.blue },
    gitcommitDiscardedType  = { fg = colors.blue },
    gitcommitBranch         = { fg = colors.orange, bold = true },
    gitcommitUntrackedFile  = { fg = colors.yellow },
    gitcommitUnmergedFile   = { fg = colors.red, bold = true },
    gitcommitDiscardedFile  = { fg = colors.red, bold = true },
    gitcommitSelectedFile   = { fg = colors.green, bold = true },

    -- Noice
    NoiceCmdlineIcon =  { fg = colors.gold },
    NoiceCmdlinePopupBorder =  { fg = colors.gold },
    NoiceCmdlineIconSearch = { fg = colors.light_blue },
    NoiceCmdlinePopupBorderSearch = { fg = colors.light_blue },

    -- Flash
    FlashMatch              = { fg = colors.light_blue, bg = colors.bg, bold = true },
    FlashLabel              = { fg = colors.yellow, bg = colors.bg, bold = true },
  }

  return groups
end

return M

