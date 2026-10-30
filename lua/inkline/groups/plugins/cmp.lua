local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    CmpItemKind           = { fg = c.purple },
    CmpItemAbbrMatch      = { fg = c.light_blue },
    CmpItemAbbrMatchFuzzy = { fg = c.light_blue },
  }
end

return M
