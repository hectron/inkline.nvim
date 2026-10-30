local config = require("inkline.config")

local M = {}

---Dim Normal and WinBar while Neovim is unfocused, e.g. in an inactive tmux pane.
---@param colors inkline.Palette
local function dim_on_focus_lost(colors)
  local group = vim.api.nvim_create_augroup("inkline", { clear = true })
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  local winbar = vim.api.nvim_get_hl(0, { name = "WinBar" })

  local function apply(bg)
    vim.api.nvim_set_hl(0, "Normal", bg and vim.tbl_extend("force", normal, { bg = bg }) or normal)
    vim.api.nvim_set_hl(0, "WinBar", bg and vim.tbl_extend("force", winbar, { bg = bg }) or winbar)
  end

  vim.api.nvim_create_autocmd("FocusLost", {
    group = group,
    callback = function()
      apply(colors.bg_alt)
    end,
  })
  vim.api.nvim_create_autocmd("FocusGained", {
    group = group,
    callback = function()
      apply(nil)
    end,
  })
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = group,
    callback = function()
      vim.api.nvim_del_augroup_by_id(group)
    end,
  })
end

---@param opts? inkline.Config
function M.load(opts)
  opts = config.extend(opts)

  local highlights, colors = require("inkline.theme").setup(opts)

  vim.cmd("hi clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "inkline-" .. opts.style

  for group, hl in pairs(highlights) do
    if type(hl) == "string" then
      hl = { link = hl }
    end
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.dim_inactive_windows and config.dim_on_focus_lost then
    dim_on_focus_lost(colors)
  else
    pcall(vim.api.nvim_del_augroup_by_name, "inkline")
  end

  if opts.terminal_colors then
    for i, color in ipairs(require("inkline.colors").terminal(colors)) do
      vim.g["terminal_color_" .. (i - 1)] = color
    end
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

---@deprecated inkline no longer caches highlights. Removes files left by older versions.
function M.clear_cache()
  for _, style in ipairs(config.styles) do
    vim.uv.fs_unlink(vim.fn.stdpath("cache") .. "/inkline-" .. style .. ".json")
  end
end

return M
