-- Modern Dark Theme Standard variant
local base = require("inkline.colors.base")
local M = {}

-- Modern variant overrides
M.colors = vim.tbl_deep_extend("force", base.base, {
  -- Variant-specific syntax colors
  function_color = "#3498db", -- Blue for functions
  constant_color = "#ffbd5e", -- Bright orange for constants
  keyword = "#ff4757",        -- Slightly more saturated red for keywords
})

return M
