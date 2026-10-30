---@alias inkline.Highlight vim.api.keyset.highlight|string A highlight definition, or the name of a group to link to
---@alias inkline.Highlights table<string, inkline.Highlight>

local M = {}

---@type string[]
M.plugins = {
  "cmp",
  "copilot",
  "dropbar",
  "flash",
  "gitsigns",
  "noice",
  "telescope",
  "treesitter_context",
  "trouble",
  "which_key",
}

---@param opts inkline.ResolvedConfig
---@return string[] module names under inkline.groups
function M.modules(opts)
  local style = require("inkline.colors." .. opts.style) ---@type inkline.StyleModule
  local modules = { "editor", "syntax", style.syntax }
  for _, plugin in ipairs(M.plugins) do
    local enabled = opts.plugins[plugin]
    if enabled == nil then
      enabled = opts.plugins.default
    end
    if enabled then
      modules[#modules + 1] = "plugins." .. plugin
    end
  end
  return modules
end

---@param c inkline.Palette
---@param opts inkline.ResolvedConfig
---@return inkline.Highlights
function M.setup(c, opts)
  local groups = {} ---@type inkline.Highlights
  for _, name in ipairs(M.modules(opts)) do
    for group, hl in pairs(require("inkline.groups." .. name).get(c, opts)) do
      groups[group] = hl
    end
  end
  return groups
end

return M
