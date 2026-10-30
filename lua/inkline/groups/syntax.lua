-- Classic syntax groups shared by every style
local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    Keyword             = { fg = c.light_red },
    Define              = { fg = c.light_red },
    Statement           = { fg = c.light_red },
    Comment             = { fg = c.comment, italic = true },
    Type                = { fg = c.blue_green },
    Identifier          = { fg = c.blue_green },
    Constant            = { fg = c.yellow_2 },
    Function            = { fg = c.gold_2 },
    Include             = { fg = c.gold },
    String              = { fg = c.string_color },
    Special             = { fg = c.teal },
    Delimiter           = { fg = c.blue_green_2 },

    rubySymbol          = { fg = c.teal },
    rubyPseudoVariable  = { fg = c.teal },
    rubyStringDelimiter = { fg = c.green },
    rubyInterpolation   = { fg = c.white },
  }
end

return M
