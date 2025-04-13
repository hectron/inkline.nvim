local M = {}

---@class inkline.Config
M.defaults = {
  dim_inactive_windows = false,
  transparent = true,
}

---@type inkline.Config
M.options = nil

---@param options? inkline.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
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
