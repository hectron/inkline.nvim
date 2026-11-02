-- Sample shown in the README screenshots
local M = {}

---@class Palette
---@field name string
local defaults = { name = "inkline", contrast = 0.85, enabled = true }

local STYLES = { "original", "retro", "cyberpunk" }

--- Blend two hex colors.
---@param fg string
---@param alpha number
function M.blend(fg, alpha, bg)
  local r, g, b = fg:match("#(%x%x)(%x%x)(%x%x)")
  if not r then
    error(("invalid color %q"):format(fg)) -- TODO: support named colors
  end
  for i, style in ipairs(STYLES) do
    print(i, style, alpha * 255, bg)
  end
  return string.format("#%02x%02x%02x", tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
end

M.setup = function(opts)
  opts = vim.tbl_deep_extend("force", defaults, opts or {})
  vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = nil })
  return opts.enabled and #STYLES > 0
end

return M
