local Util = require("inkline.util")

local M = {}

function M.get(colors, opts)
  -- stylua: ignore
  local groups = {
    Normal                = { fg = colors.white, bg = colors.bg },
    NormalNC              = { fg = colors.white, bg = opts.dim_inactive_windows and colors.bg_alt or colors.bg },
    Cursor                = { fg = colors.black, bg = colors.yellow },
    CursorLine            = { bg = colors.dark_olive },

    Keyword               = { fg = colors.light_red },
    Define                = { fg = colors.light_red },
    Statement             = { fg = colors.light_red },
    Comment               = { fg = opts.purple_comments and colors.purple or colors.dark_grey_5, italic = true },
    Type                  = { fg = colors.blue_green },
    Identifier            = { fg = colors.blue_green },
    Constant              = { fg = colors.yellow_2 },
    Function              = { fg = colors.gold_2 },
    Include               = { fg = colors.gold },
    String                = { fg = colors.green },
    Search                = { bg = colors.light_blue, fg = colors.black },
    CurSearch             = { bg = colors.light_orange, fg = colors.black },
    Special               = { fg = colors.teal },
    Delimiter             = { fg = colors.blue_green_2 },
    rubySymbol            = { fg = colors.teal },
    rubyPseudoVariable    = { fg = colors.teal },
    rubyStringDelimiter   = { fg = colors.green },
    rubyInterpolation     = { fg = colors.white },
    MatchParen            = { fg = colors.green,  bold = true },
    StatusLine            = { bg = colors.none },
    CursorLineNr          = { fg = colors.light_orange, bold = true },
    PmenuSel              = { bg = colors.bg_highlight, reverse = false, underline = false},
    Visual                = { bg = colors.bg_highlight },
    WinBar                = { fg = colors.white, bold = false },

    -- Diff Highlights
    DiffAdd               = { bg = colors.dark_blue },
    DiffChange            = { bg = colors.dark_magenta },
    DiffDelete            = { fg = colors.blue, bg = colors.dark_cyan, bold = true },
    DiffText              = { bg = colors.red, bold = true },

    -- Links
    diffAdded             = { link = "String" },
    diffRemoved           = { link = "Statement" },
    diffLine              = { link = "PreProc" },
    diffSubname           = { link = "Comment" },
    SignColumn            = {}, -- clears it

    DiagnosticUnnecessary = { fg = colors.grey, italic = true },

    -- GitSigns
    Added                    = { fg = colors.green },
    Changed                  = { fg = colors.teal },
    Removed                  = { fg = colors.red },
    GitSignsCurrentLineBlame = { fg = colors.dark_grey_5 },

    -- Dropbar
    DropBarIconUISeparator = { link = "DropBarIconKindSection", bold = false },
    DropBarIconUISeparatorNC = { link = "DropBarIconKindSectionNC" },
    DropBarIconKindFolderNC = { link = "DropBarIconKindFolder" },
    DropBarIconUIPickPivot = { fg = colors.red},
    DropBarMenuHoverSymbol = { bold = true },
    DropBarMenuHoverEntry = { bg = colors.dark_olive },
    DropBarMenuFloatBorder = { bg = colors.white },
    DropBarMenuHoverIcon = { reverse = false },
    DropBarCurrentContext = { bold = true },
    DropBarCurrentContextName = { bold = true, fg = colors.white  },
    DropBarIconUISeparatorMenu = { bold = false},

    -- Copilot
    CopilotSuggestion = { fg = colors.dark_grey_6, italic = true },
    CopilotAnnotation = { link = "CopilotSuggestion" },

  }
  if opts.dim_inactive_windows then
    groups.WinBarNC = { fg = colors.dark_grey_6, bg = colors.bg_alt }
  end

  return groups
end

return M
