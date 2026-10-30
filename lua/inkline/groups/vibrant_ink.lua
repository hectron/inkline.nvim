-- Syntax for the original style, following TextMate's vibrant-ink
local Util = require("inkline.util")

local M = {}

---@param c table
function M.get(c)
  -- stylua: ignore
  return {
    diffAdded               = { link = "String" },
    diffRemoved             = { link = "Statement" },
    diffLine                = { link = "PreProc" },
    diffSubname             = { link = "Comment" },

    gitcommitOverflow       = { fg = c.red },
    gitcommitSummary        = { fg = c.blue },
    gitcommitComment        = { fg = c.dark_grey_5 },
    gitcommitUntracked      = { fg = c.dark_grey_5 },
    gitcommitDiscarded      = { fg = c.dark_grey_5 },
    gitcommitSelected       = { fg = c.dark_grey_5 },
    gitcommitHeader         = { fg = c.purple },
    gitcommitSelectedType   = { fg = c.blue },
    gitcommitUnmergedType   = { fg = c.blue },
    gitcommitDiscardedType  = { fg = c.blue },
    gitcommitBranch         = { fg = c.orange, bold = true },
    gitcommitUntrackedFile  = { fg = c.yellow },
    gitcommitUnmergedFile   = { fg = c.red, bold = true },
    gitcommitDiscardedFile  = { fg = c.red, bold = true },
    gitcommitSelectedFile   = { fg = c.green, bold = true },

    ["@annotation"]                 = "PreProc",
    ["@attribute"]                  = "PreProc",
    ["@boolean.lua"]                = { fg = c.orange },
    ["@character.printf"]           = "SpecialChar",
    ["@comment.error"]              = { fg = c.error },
    ["@comment.hint"]               = { fg = c.hint },
    ["@comment.info"]               = { fg = c.info },
    ["@comment.note"]               = { fg = c.hint },
    ["@comment.todo"]               = { fg = c.todo },
    ["@comment.warning"]            = { fg = c.warning },
    ["@constant.lua"]               = { fg = c.yellow_2 },
    ["@constant.macro"]             = "Define",
    ["@constructor"]                = { fg = c.purple_3 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@diff.delta"]                 = "DiffChange",
    ["@diff.minus"]                 = "DiffDelete",
    ["@diff.plus"]                  = "DiffAdd",
    ["@function.macro"]             = "Macro",
    ["@function.method"]            = "Function",
    ["@keyword"]                    = { fg = Util.blend_bg(c.orange, 0.9) }, -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"]        = "Conditional",
    ["@keyword.debug"]              = "Debug",
    ["@keyword.directive"]          = "PreProc",
    ["@keyword.directive.define"]   = "Define",
    ["@keyword.exception"]          = "Exception",
    ["@keyword.function"]           = { fg = c.orange }, -- For keywords used to define a function.
    ["@keyword.import"]             = "Include",
    ["@keyword.operator"]           = "@operator",
    ["@keyword.operator.lua"]       = "Statement",
    ["@keyword.repeat"]             = "Repeat",
    ["@keyword.storage"]            = "StorageClass",
    ["@markup"]                     = "@none",
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    ["@markup.heading.1.markdown"]  = { fg = c.header_1, bold = true },
    ["@markup.heading.2.markdown"]  = { fg = c.header_2, bold = true },
    ["@markup.heading.3.markdown"]  = { fg = c.header_3, bold = true },
    ["@markup.heading.4.markdown"]  = { fg = c.header_4, bold = true },
    ["@markup.heading.5.markdown"]  = { fg = c.header_5, bold = true },
    ["@markup.heading.6.markdown"]  = { fg = c.header_6, bold = true },
    ["@markup.italic"]              = { italic = true },
    ["@markup.link.label"]          = "SpecialChar",
    ["@markup.link.label.symbol"]   = "Identifier",
    ["@markup.link.url"]            = "Keyword",
    ["@markup.list"]                = "Identifier",
    ["@markup.list.checked"]        = { fg = c.green },
    ["@markup.list.markdown"]       = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"]      = { fg = c.blue },
    ["@markup.math"]                = "Special",
    ["@markup.raw"]                 = "String",
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.strong"]              = { bold = true },
    ["@markup.underline"]           = { underline = true },
    ["@module"]                     = "Include",
    ["@namespace"]                  = "Include",
    ["@none"]                       = {},
    ["@operator"]                   = { fg = Util.blend_fg(c.blue_green_2, 0.6) }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@parameter"]                  = "Identifier",
    ["@preproc"]                    = "PreProc",
    ["@property"]                   = { fg = c.blue_green }, -- Main branch uses blue_green for properties
    ["@punctuation.bracket"]        = "Delimiter",
    ["@punctuation.delimiter"]      = "Delimiter",
    ["@punctuation.special"]        = "Delimiter",
    ["@string.documentation"]       = { fg = c.yellow },
    ["@string.escape"]              = { fg = c.purple_2 }, -- For escape characters within a string.
    ["@string.regexp"]              = { fg = c.cyan },     -- For regexes.
    ["@string.special.symbol"]      = "Identifier",
    ["@string.special.url"]         = "Keyword",
    ["@tag"]                        = "Label",
    ["@tag.attribute"]              = "Identifier",
    ["@tag.delimiter"]              = "Delimiter",
    ["@type.builtin"]               = "Type",
    ["@type.definition"]            = "Typedef",
    ["@type.qualifier"]             = "@keyword",
    ["@variable"]                   = { fg = c.fg },                             -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { fg = c.pink },                           -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.parameter"]         = { fg = c.blue_green },                     -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = Util.blend_fg(c.blue_green, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ["@variable.parameter.lua"]     = { fg = c.pink },

    ["@lsp.type.macro"]         = "@function.macro",
    ["@lsp.type.namespace"]     = "@namespace",
    ["@lsp.type.parameter"]     = "@parameter",
    ["@lsp.type.parameter.lua"] = "@variable.parameter.lua",
  }
end

return M
