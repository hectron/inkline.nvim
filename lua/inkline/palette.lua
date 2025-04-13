local M = {}

---@class inkline.Palette
M.colors = {
  none         = "NONE",
  black        = "#000000",
  blue         = "#0000FF",
  dark_blue    = "#00008B",
  dark_cyan    = "#008B8B",
  dark_magenta = "#8B008B",
  gold         = "#FFCC00",
  green        = "#66FF00",
  dark_olive   = "#323300",
  orange       = "#FF6600",
  purple       = "#9933CC",
  red          = "#FF0000",
  teal         = "#339999",
  white        = "#FFFFFF",
  yellow       = "#FFFF00",
  pale_yellow  = "#FFEE98",
}

M.highlights = {
  Normal              = { fg = M.colors.white, bg = M.colors.black },
  Cursor              = { fg = M.colors.black, bg = M.colors.yellow },
  CursorLine          = { bg = M.colors.dark_olive },

  Keyword             = { fg = M.colors.orange },
  Define              = { fg = M.colors.orange },
  Statement           = { fg = M.colors.orange },
  Comment             = { fg = M.colors.purple },
  Type                = { fg = M.colors.white },
  Identifier          = { fg = M.colors.white },
  Constant            = { fg = M.colors.pale_yellow },
  Function            = { fg = M.colors.gold },
  Include             = { fg = M.colors.gold },
  String              = { fg = M.colors.green },
  Search              = { bg = M.colors.white },
  rubySymbol          = { fg = M.colors.teal },
  rubyPseudoVariable  = { fg = M.colors.teal },
  rubyStringDelimiter = { fg = M.colors.green },
  rubyInterpolation   = { fg = M.colors.white },

  -- Diff Highlights
  DiffAdd             = { bg = M.colors.dark_blue },
  DiffChange          = { bg = M.colors.dark_magenta },
  DiffDelete          = { fg = M.colors.blue, bg = M.colors.dark_cyan, bold = true },
  DiffText            = { bg = M.colors.red, bold = true },

  -- Links
  diffAdded           = { link = "String" },
  diffRemoved         = { link = "Statement" },
  diffLine            = { link = "PreProc" },
  diffSubname         = { link = "Comment" },
  SignColumn          = {}, -- clears it
}

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  local highlights = vim.tbl_deep_extend("force", M.highlights, {})

  if opts.transparent then
    highlights.Normal.bg = M.colors.none
  end

  return highlights
end

return M
