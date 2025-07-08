-- Classic variant (original starting point)
local base = require("inkline.colors.base")
local M = {}

-- Classic variant overrides
M.colors = vim.tbl_deep_extend("force", base.base, {
  -- Variant-specific syntax colors
  function_color = "#3498db", -- Blue for functions
  constant_color = "#f1c40f", -- Yellow for constants
})

return M

