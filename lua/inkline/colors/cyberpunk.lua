-- Cyberpunk Inspired variant
local base = require("inkline.colors.base")
local M = {}

-- Cyberpunk variant overrides
M.colors = vim.tbl_deep_extend("force", base.base, {
  -- Variant-specific syntax colors
  function_color = "#00ffff", -- Electric cyan for functions
  property = base.base.magenta,
  constant_color = "#66FF00", -- Matrix green for constants
})

M.syntax = "modern"

return M
