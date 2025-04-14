-- A theme is composed of colors (palette) and highlight groups.
-- Generally, a theme is defined in colors.
-- A highlight group is built by colors.
local M = {}

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  local colors = require("inkline.colors").setup(opts)
  local highlights = require("inkline.groups").setup(colors, opts)

  return highlights
end

return M
