local config = require("inkline.config")

local M = {}

---@param opts? inkline.Config
function M.load(opts)
  opts = config.extend(opts)

  local highlights = require("inkline.theme").setup(opts)

  vim.cmd("hi clear")
  vim.o.background = "dark"
  vim.g.colors_name = "inkline-" .. opts.style

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, type(hl) == "string" and { link = hl } or hl)
  end
end

M.setup = config.setup

---@return inkline.Style[]
function M.get_styles()
  return config.styles
end

---@param style inkline.Style
function M.switch_style(style)
  if not vim.tbl_contains(config.styles, style) then
    vim.notify(
      "inkline.nvim: Unknown style '" .. style .. "'. Available: " .. table.concat(config.styles, ", "),
      vim.log.levels.ERROR
    )
    return
  end

  config.options.style = style
  vim.cmd.colorscheme("inkline-" .. style)
end

---Clear the cache for all styles
function M.clear_cache()
  require("inkline.util").cache.clear()
  vim.notify("inkline.nvim: Cache cleared", vim.log.levels.INFO)
end

return M
