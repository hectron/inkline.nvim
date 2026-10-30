local M = {}

---@param c table
---@param opts inkline.ResolvedConfig
function M.setup(c, opts)
  local syntax = require("inkline.colors." .. opts.style).syntax
  local groups = {}
  for _, name in ipairs({ "editor", "syntax", syntax }) do
    for group, hl in pairs(require("inkline.groups." .. name).get(c, opts)) do
      groups[group] = hl
    end
  end
  return groups
end

return M
