-- Pure composition: resolved options -> palette -> highlight groups. No editor state is touched.
local M = {}

---@param opts? inkline.Config
---@return table<string, table|string> highlights, table colors
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  local colors = require("inkline.colors").setup(opts)
  local highlights = require("inkline.groups").setup(colors, opts)

  if opts.on_highlights then
    highlights = opts.on_highlights(highlights, colors) or highlights
  end

  return highlights, colors
end

return M
