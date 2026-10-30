-- Refined Retro variant
local base = require("inkline.colors.base")

---@type inkline.StyleModule
return {
  syntax = "modern",
  colors = vim.tbl_deep_extend("force", base.base, {
    function_color = "#5ea1ff", -- Light blue for functions
    property = base.base.pink,
    constant_color = "#ffd43b", -- Warm yellow for constants
  }),
}
