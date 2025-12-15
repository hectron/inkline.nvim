local M = {}

---@param colors inkline.Palette
---@param opts? inkline.Config
function M.setup(colors, opts)
  opts = require("inkline.config").extend(opts)
  local Util = require("inkline.util")

  local cache_key = opts.style
  local cache = opts.cache and Util.cache.read(cache_key)

  local inputs = {
    colors = colors,
    options = {
      style = opts.style,
      transparent = opts.transparent,
      dim_inactive_windows = opts.dim_inactive_windows,
      vibrant_strings = opts.vibrant_strings,
      purple_comments = opts.purple_comments,
    },
  }

  if cache and cache.inputs and vim.deep_equal(cache.inputs, inputs) then
    return cache.groups
  end

  local groups = {}
  local base_groups, treesitter_groups, lsp_groups

  -- Use variant-specific highlight groups for original style
  if opts.style == "original" then
    base_groups = require("inkline.groups.original.base").get(colors, opts)
    treesitter_groups = require("inkline.groups.original.treesitter").get(colors, opts)
    lsp_groups = require("inkline.groups.original.lsp").get(colors, opts)
  else
    -- Use modern highlight groups for other variants
    base_groups = require("inkline.groups.base").get(colors, opts)
    treesitter_groups = require("inkline.groups.treesitter").get(colors, opts)
    lsp_groups = require("inkline.groups.lsp").get(colors, opts)
  end

  local function merge_tables(dest, src)
    for k, v in pairs(src) do
      dest[k] = v
    end
  end
  merge_tables(groups, base_groups)
  merge_tables(groups, treesitter_groups)
  merge_tables(groups, lsp_groups)

  if opts.cache then
    Util.cache.write(cache_key, { groups = groups, inputs = inputs })
  end

  return groups
end

return M
