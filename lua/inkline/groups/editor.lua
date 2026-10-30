local M = {}

---@param c inkline.Palette
---@param opts inkline.ResolvedConfig
---@return inkline.Highlights
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
  }

  if opts.dim_inactive_windows then
    groups.WinBarNC = { fg = c.dark_grey_6, bg = c.bg_alt }
  end

  return groups
end

return M
