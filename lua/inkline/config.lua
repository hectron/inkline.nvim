local M = {}

---@class inkline.Config
M.defaults = {
  dim_inactive_windows = true,
  transparent = false,
  purple_comments = false,
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
