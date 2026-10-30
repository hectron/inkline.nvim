local M = {}

---@alias inkline.Style "original" | "retro" | "cyberpunk"

---@class inkline.Config
---@field style? inkline.Style
---@field dim_inactive_windows? boolean
---@field transparent? boolean
---@field purple_comments? boolean
---@field vibrant_strings? boolean
---@field terminal_colors? boolean
---@field plugins? table<string, boolean> `default` sets every plugin; plugin names override it
---@field cache? boolean Deprecated and ignored
---@field on_colors? fun(colors: table): table?
---@field on_highlights? fun(highlights: table, colors: table): table?

---@class inkline.ResolvedConfig : inkline.Config
---@field style inkline.Style
---@field dim_inactive_windows boolean
---@field transparent boolean
---@field purple_comments boolean
---@field vibrant_strings boolean
---@field terminal_colors boolean
---@field plugins table<string, boolean>

---@type inkline.Style[]
M.styles = { "original", "retro", "cyberpunk" }

---@type inkline.ResolvedConfig
M.defaults = {
  style = "original",
  dim_inactive_windows = true,
  transparent = false,
  purple_comments = false,
  vibrant_strings = true,
  terminal_colors = true,
  plugins = { default = true },
  on_colors = nil,
  on_highlights = nil,
}

---@type inkline.ResolvedConfig
M.options = vim.deepcopy(M.defaults)

---@param opts table
---@return boolean ok, string? err
function M.validate(opts)
  return pcall(function()
    vim.validate("style", opts.style, "string")
    vim.validate("dim_inactive_windows", opts.dim_inactive_windows, "boolean")
    vim.validate("transparent", opts.transparent, "boolean")
    vim.validate("purple_comments", opts.purple_comments, "boolean")
    vim.validate("vibrant_strings", opts.vibrant_strings, "boolean")
    vim.validate("terminal_colors", opts.terminal_colors, "boolean")
    vim.validate("plugins", opts.plugins, "table")
    vim.validate("on_colors", opts.on_colors, "function", true)
    vim.validate("on_highlights", opts.on_highlights, "function", true)
  end)
end

---Store options for later loads. Does not apply the colorscheme.
---@param options? inkline.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
  local ok, err = M.validate(M.options)
  if not ok then
    vim.notify("inkline.nvim: " .. err, vim.log.levels.ERROR)
  end
end

---Options from setup() with per-load overrides applied.
---@param options? inkline.Config
---@return inkline.ResolvedConfig
function M.extend(options)
  local opts = vim.tbl_deep_extend("force", {}, M.options, options or {})
  if not vim.tbl_contains(M.styles, opts.style) then
    vim.notify(
      ("inkline.nvim: unknown style %q, using \"original\". Available: %s"):format(
        tostring(opts.style),
        table.concat(M.styles, ", ")
      ),
      vim.log.levels.WARN
    )
    opts.style = "original"
  end
  return opts
end

return M
