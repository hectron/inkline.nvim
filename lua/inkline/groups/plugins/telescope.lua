local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    TelescopeNormal    = { fg = c.white, bg = c.bg },
    TelescopeSelection = { fg = c.white, bg = c.bg_highlight },
  }
end

return M
