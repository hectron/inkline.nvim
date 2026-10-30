local M = {}

---@param c table
function M.get(c)
  -- stylua: ignore
  return {
    TelescopeNormal    = { fg = c.white, bg = c.bg },
    TelescopeSelection = { fg = c.white, bg = c.bg_highlight },
  }
end

return M
