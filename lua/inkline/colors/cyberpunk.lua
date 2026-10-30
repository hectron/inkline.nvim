-- Cyberpunk Inspired variant
local base = require("inkline.colors.base")

---@type inkline.StyleModule
return {
  syntax = "modern",
  colors = vim.tbl_deep_extend("force", base.base, {
    function_color = "#00ffff", -- Electric cyan for functions
    property = base.base.magenta,
    constant_color = "#66FF00", -- Matrix green for constants
  }),
}
