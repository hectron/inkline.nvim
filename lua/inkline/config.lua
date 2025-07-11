local M = {}

---@alias inkline.Style "original" | "classic" | "modern" | "retro" | "cyberpunk"

---@class inkline.Config
---@field style? inkline.Style
---@field dim_inactive_windows? boolean
---@field transparent? boolean
---@field purple_comments? boolean
---@field vibrant_strings? boolean
---@field cache? boolean
---@field on_colors? fun(colors: table): table
---@field on_highlights? fun(highlights: table, colors: table): table

---@class inkline.Cache
---@field groups table<string, vim.api.keyset.highlight>
---@field inputs inkline.CacheInputs

---@class inkline.CacheInputs
---@field colors table
---@field options inkline.Config
M.defaults = {
  style = "original",
  dim_inactive_windows = true,
  transparent = false,
  purple_comments = false,
  vibrant_strings = true,
  cache = true,
  on_colors = nil,
  on_highlights = nil,
}

---@type inkline.Config
M.options = nil

---@param options? inkline.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})

  vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
      -- These need to be applied on each buffer enter event
      vim.api.nvim_set_hl(0, "DropBarIconUISeparatorMenu", {})
      vim.api.nvim_set_hl(0, "DropBarMenuHoverIcon", { reverse = false })
    end
  })
end

---@param options? inkline.Config
function M.extend(options)
  return options and vim.tbl_deep_extend("force", {}, M.options, options) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M
