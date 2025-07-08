-- Original variant (preserves main branch colors)
local base = require("inkline.colors.base")
local M = {}

-- Original variant overrides to match main branch exactly
M.colors = vim.tbl_deep_extend("force", base.base, {
  -- Core colors from main branch
  blue = "#0000FF",
  cyan = "#5ef1ff",
  teal = "#4ef2f2",
  blue_green = "#44fbbe",
  blue_green_2 = "#93ffdd",
  red = "#FF0000",
  orange = "#FF6600",   -- Exact main branch orange for lualine
  orange_2 = "#FF8800", -- Also from main branch
  yellow = "#FFFF00",

  -- Syntax colors matching main branch exactly
  function_color = "#ffbb00", -- Gold for functions (gold_2 from main)
  constant_color = "#ffdd00", -- Yellow for constants (yellow_2 from main)

  -- Update all color values to match main branch exactly
  gold_2 = "#ffbb00",      -- Function color in main
  yellow_2 = "#ffdd00",    -- Constant color in main
  light_red = "#ff4f3f",   -- Keyword/Statement color in main
  blue_green = "#44fbbe",  -- Type/Identifier color in main
  blue_green_2 = "#93ffdd" -- Delimiter color in main
})

return M

