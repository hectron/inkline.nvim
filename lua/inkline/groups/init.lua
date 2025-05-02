local M = {}

---@param colors inkline.Palette
---@param opts? inkline.Config
function M.setup(colors, opts)
  opts = require("inkline.config").extend(opts)

  local groups = {
    Normal                = { fg = colors.white, bg = colors.bg },
    Cursor                = { fg = colors.black, bg = colors.yellow },
    CursorLine            = { bg = colors.dark_olive },

    Keyword               = { fg = colors.orange },
    Define                = { fg = colors.orange },
    Statement             = { fg = colors.orange },
    Comment               = { fg = colors.purple, italic = true },
    Type                  = { fg = colors.white },
    Identifier            = { fg = colors.white },
    Constant              = { fg = colors.pale_yellow },
    Function              = { fg = colors.gold },
    Include               = { fg = colors.gold },
    String                = { fg = colors.green },
    Search                = { bg = colors.white, fg = colors.black },
    rubySymbol            = { fg = colors.teal },
    rubyPseudoVariable    = { fg = colors.teal },
    rubyStringDelimiter   = { fg = colors.green },
    rubyInterpolation     = { fg = colors.white },
    StatusLine            = { bg = colors.none },
    CursorLineNr          = { fg = colors.light_orange, bold = true },

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

    -- Treesitter
    DiagnosticUnnecessary = { fg = colors.grey, italic = true },

    -- GitSigns
    GitSignsCurrentLineBlame = { fg = colors.dark_grey_5 }

    -- ["@variable.member.lua"] = { fg = colors.light_blue },

    -- LSP
    -- ["@lsp.type.parameter.lua"] = { fg = colors.},
  }

  return groups
end

return M
