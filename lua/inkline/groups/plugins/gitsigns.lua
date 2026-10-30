local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    GitSignsAdd              = { fg = c.green },
    GitSignsAddInline        = { bg = c.dark_green_2, fg = c.white },
    GitSignsChange           = { fg = c.teal },
    GitSignsChangeInline     = { bg = c.dark_green_2, fg = c.white },
    GitSignsDelete           = { fg = c.red },
    GitSignsDeleteInline     = { bg = c.dark_red_2, fg = c.white },
    GitSignsCurrentLineBlame = { fg = c.dark_grey_5 },
  }
end

return M
