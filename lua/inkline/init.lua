local config = require("inkline.config")

local M = {}

---@param opts? inkline.Config
function M.load(opts)
  opts = require("inkline.config").extend(opts)

  -- "compile" the theme
  local highlight_groups = require("inkline.theme").setup(opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "inkline-" .. opts.style

  for group, hl in pairs(highlight_groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end
end

M.setup = config.setup

-- Expose available styles
---@return inkline.Style[]
function M.get_styles()
  return require("inkline.colors").styles
end

-- Function to switch styles at runtime
---@param style inkline.Style
function M.switch_style(style)
  local colors_module = require("inkline.colors")
  if not vim.tbl_contains(colors_module.styles, style) then
    vim.notify("inkline.nvim: Unknown style '" .. style .. "'. Available: " .. table.concat(colors_module.styles, ", "), vim.log.levels.ERROR)
    return
  end
  
  -- Update config and reload
  config.options.style = style
  M.load(config.options)
  vim.notify("inkline.nvim: Switched to style '" .. style .. "'", vim.log.levels.INFO)
end

return M
