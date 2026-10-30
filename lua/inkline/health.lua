local M = {}

local known_options = {
  cache = true,
  on_colors = true,
  on_highlights = true,
}

function M.check()
  local health = vim.health
  local config = require("inkline.config")
  local opts = config.options

  health.start("inkline.nvim")

  if vim.fn.has("nvim-0.11") == 1 then
    health.ok("Neovim " .. tostring(vim.version()))
  else
    health.error("Neovim 0.11 or newer is required")
  end

  local ok, err = config.validate(opts)
  if ok then
    health.ok("Options are valid")
  else
    health.error(err or "Invalid options")
  end

  for key in pairs(opts) do
    if config.defaults[key] == nil and not known_options[key] then
      health.warn(("Unknown option %q"):format(key), "Check for a typo; see :h inkline-options")
    end
  end

  if opts.cache ~= nil then
    health.info("`cache` is deprecated and ignored; inkline no longer caches highlights")
  end

  if not vim.tbl_contains(config.styles, opts.style) then
    health.warn(('Unknown style %q; "original" is used instead'):format(tostring(opts.style)))
  end

  local plugins = require("inkline.groups").plugins
  for name in pairs(type(opts.plugins) == "table" and opts.plugins or {}) do
    if name ~= "default" and not vim.tbl_contains(plugins, name) then
      health.warn(("Unknown plugin %q in `plugins`"):format(name), "Available: " .. table.concat(plugins, ", "))
    end
  end

  if vim.o.termguicolors then
    health.ok("'termguicolors' is on")
  else
    health.warn("'termguicolors' is off, so inkline's colors are not shown", "Set `vim.o.termguicolors = true`")
  end

  local active = vim.g.colors_name
  if active and active:find("^inkline") then
    health.ok("Active colorscheme: " .. active)
  else
    health.info("inkline is not the active colorscheme")
  end
end

return M
