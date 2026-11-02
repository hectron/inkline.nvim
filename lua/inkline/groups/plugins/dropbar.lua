local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    DropBarIconUISeparator     = { link = "DropBarIconKindSection", bold = false },
    DropBarIconUISeparatorNC   = "DropBarIconKindSectionNC",
    DropBarIconKindFolderNC    = "DropBarIconKindFolder",
    DropBarIconUIPickPivot     = { fg = c.red },
    DropBarMenuHoverSymbol     = { bold = true },
    DropBarMenuHoverEntry      = { bg = c.dark_olive },
    DropBarMenuFloatBorder     = { bg = c.white },
    DropBarMenuHoverIcon       = "DropBarMenuHoverEntry",
    DropBarCurrentContext      = { bold = true },
    DropBarCurrentContextName  = { bold = true, fg = c.white },
    DropBarIconUISeparatorMenu = "NormalFloat",
  }
end

return M
