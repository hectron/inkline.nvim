local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    FlashMatch = { fg = c.light_blue, bg = c.bg, bold = true },
    FlashLabel = { fg = c.yellow, bg = c.bg, bold = true },
  }
end

return M
