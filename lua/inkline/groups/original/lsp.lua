-- Original variant LSP highlights (from main branch)
local M = {}

function M.get(colors, opts)
  -- stylua: ignore
  local ret = {
    -- LSP semantic tokens
    ["@lsp.type.class"]         = "@type",
    ["@lsp.type.comment"]       = "@comment",
    ["@lsp.type.decorator"]     = "@attribute",
    ["@lsp.type.enum"]          = "@type",
    ["@lsp.type.enumMember"]    = "@constant",
    ["@lsp.type.function"]      = "@function",
    ["@lsp.type.interface"]     = "@type",
    ["@lsp.type.macro"]         = "@macro",
    ["@lsp.type.method"]        = "@function.method",
    ["@lsp.type.namespace"]     = "@namespace",
    ["@lsp.type.parameter"]     = "@parameter",
    ["@lsp.type.parameter.lua"] = "@variable.parameter.lua",
    ["@lsp.type.property"]      = "@property",
    ["@lsp.type.struct"]        = "@type",
    ["@lsp.type.type"]          = "@type",
    ["@lsp.type.typeParameter"] = "@type.definition",
    ["@lsp.type.variable"]      = "@variable",
  }

  return ret
end

return M

