local M = {}

---@param c table
function M.get(c)
  -- stylua: ignore
  return {
    CopilotSuggestion = { fg = c.dark_grey_6, italic = true },
    CopilotAnnotation = "CopilotSuggestion",
  }
end

return M
