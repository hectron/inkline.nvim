local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    NoiceCmdlineIcon              = { fg = c.gold },
    NoiceCmdlinePopupBorder       = { fg = c.gold },
    NoiceCmdlineIconSearch        = { fg = c.light_blue },
    NoiceCmdlinePopupBorderSearch = { fg = c.light_blue },
  }
end

return M
