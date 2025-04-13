local config = require("inkline.config")

local M = {}

---@param opts? inkline.Config
function M.load(opts)
  opts = require("inkline.config").extend(opts)

  -- "compile" the theme
  local bg = vim.o.background
  local palette = require("inkline.palette").setup(opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "inkline"

  for group, hl in pairs(palette) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end
end

M.setup = config.setup

return M
