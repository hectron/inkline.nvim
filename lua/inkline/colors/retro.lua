-- Refined Retro variant
local base = require("inkline.colors.base")
local M = {}

-- Retro variant overrides
M.colors = vim.tbl_deep_extend("force", base.base, {
  -- Variant-specific syntax colors
  function_color = "#5ea1ff", -- Light blue for functions
  constant_color = "#ffd43b", -- Warm yellow for constants
})

return M

