local M = {}

-- Dynamic color loader that loads variants based on style
local styles = setmetatable({}, {
  __index = function(_, style)
    local ok, palette = pcall(require, "inkline.colors." .. style)
    if not ok then
      vim.notify("inkline.nvim: style '" .. style .. "' not found, falling back to 'modern'", vim.log.levels.WARN)
      palette = require("inkline.colors.modern")
    end
    return palette.colors
  end,
})

---@param opts? inkline.Config
function M.setup(opts)
  opts = require("inkline.config").extend(opts)

  -- Get base colors for the selected style
  local colors = vim.deepcopy(styles[opts.style])

  -- Apply transparency if enabled
  if opts.transparent then
    colors.bg = colors.none
  end

  -- Set string color based on vibrant_strings option
  if opts.vibrant_strings then
    colors.string_color = colors.green -- #66FF00 (vibrant lime green)
  else
    colors.string_color = "#27ae60"    -- soft forest green (default)
  end

  -- Apply user color overrides
  if opts.on_colors then
    colors = opts.on_colors(colors) or colors
  end

  return colors, opts
end

-- Expose available styles for introspection
---@type inkline.Style[]
M.styles = {
  "classic",
  "modern",
  "retro",
  "cyberpunk"
}

return M

