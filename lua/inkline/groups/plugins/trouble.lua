local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    TroubleNormalNC  = "NormalNC",
    TroubleCount     = { fg = c.yellow, bg = c.bg_highlight, bold = true },
    TroubleFilename  = { fg = c.light_blue },
    TroubleDirectory = { fg = c.light_blue },
    TroubleIndent    = { fg = c.dark_grey_3 },
  }
end

return M
