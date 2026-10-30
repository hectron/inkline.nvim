local M = {}

M.plugins = {
  "cmp",
  "copilot",
  "dropbar",
  "flash",
  "gitsigns",
  "noice",
  "telescope",
  "treesitter_context",
  "which_key",
}

---@param opts inkline.ResolvedConfig
---@return string[] module names under inkline.groups
function M.modules(opts)
  local modules = { "editor", "syntax", require("inkline.colors." .. opts.style).syntax }
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

---@param c table
---@param opts inkline.ResolvedConfig
function M.setup(c, opts)
  local groups = {}
  for _, name in ipairs(M.modules(opts)) do
    for group, hl in pairs(require("inkline.groups." .. name).get(c, opts)) do
      groups[group] = hl
    end
  end
  return groups
end

return M
