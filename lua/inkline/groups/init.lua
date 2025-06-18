local M = {}

---@param colors inkline.Palette
---@param opts? inkline.Config
function M.setup(colors, opts)
  opts = require("inkline.config").extend(opts)

  local groups = {}
  local base_groups = require("inkline.groups.base").get(colors, opts)
  local treesitter_groups = require("inkline.groups.treesitter").get(colors, opts)
  local lsp_groups = require("inkline.groups.lsp").get(colors, opts)

  local function merge_tables(dest, src)
    for k, v in pairs(src) do
      dest[k] = v
    end
  end

  merge_tables(groups, base_groups)
  merge_tables(groups, treesitter_groups)
  merge_tables(groups, lsp_groups)

  opts.on_highlights(groups, colors)

  return groups
end

return M
