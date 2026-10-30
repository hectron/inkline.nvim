local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    TreesitterContext       = { fg = c.grey, bg = c.bg },
    TreesitterContextBottom = { sp = c.dark_grey_4, underline = true },
  }
end

return M
