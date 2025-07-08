-- Original variant treesitter highlights (from main branch)
local Util = require("inkline.util")

local M = {}

function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    ["@annotation"]                 = "PreProc",
    ["@attribute"]                  = "PreProc",
    ["@boolean"]                    = "Boolean",
    ["@boolean.lua"]                = { fg = c.orange },
    ["@character"]                  = "Character",
    ["@character.printf"]           = "SpecialChar",
    ["@character.special"]          = "SpecialChar",
    ["@comment"]                    = "Comment",
    ["@comment.error"]              = { fg = c.error },
    ["@comment.hint"]               = { fg = c.hint },
    ["@comment.info"]               = { fg = c.info },
    ["@comment.note"]               = { fg = c.hint },
    ["@comment.todo"]               = { fg = c.todo },
    ["@comment.warning"]            = { fg = c.warning },
    ["@constant"]                   = "Constant",
    ["@constant.lua"]               = { fg = c.yellow_2 },
    ["@constant.builtin"]           = "Special",
    ["@constant.macro"]             = "Define",
    ["@constructor"]                = { fg = c.purple_3 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@diff.delta"]                 = "DiffChange",
    ["@diff.minus"]                 = "DiffDelete",
    ["@diff.plus"]                  = "DiffAdd",
    ["@function"]                   = "Function",
    ["@function.builtin"]           = "Special",
    ["@function.call"]              = "@function",
    ["@function.macro"]             = "Macro",
    ["@function.method"]            = "Function",
    ["@function.method.call"]       = "@function.method",
    ["@keyword"]                    = { fg = Util.blend_bg(c.orange, 0.9) }, -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"]        = "Conditional",
    ["@keyword.coroutine"]          = "@keyword",
    ["@keyword.debug"]              = "Debug",
    ["@keyword.directive"]          = "PreProc",
    ["@keyword.directive.define"]   = "Define",
    ["@keyword.exception"]          = "Exception",
    ["@keyword.function"]           = { fg = c.orange }, -- For keywords used to define a function.
    ["@keyword.import"]             = "Include",
    ["@keyword.operator"]           = "@operator",
    ["@keyword.operator.lua"]       = "Statement",
    ["@keyword.repeat"]             = "Repeat",
    ["@keyword.return"]             = "@keyword",
    ["@keyword.storage"]            = "StorageClass",
    ["@label"]                      = "Label",
    ["@markup"]                     = "@none",
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    ["@markup.heading"]             = "Title",
    ["@markup.heading.1.markdown"]  = { fg = c.header_1, bold = true },
    ["@markup.heading.2.markdown"]  = { fg = c.header_2, bold = true },
    ["@markup.heading.3.markdown"]  = { fg = c.header_3, bold = true },
    ["@markup.heading.4.markdown"]  = { fg = c.header_4, bold = true },
    ["@markup.heading.5.markdown"]  = { fg = c.header_5, bold = true },
    ["@markup.heading.6.markdown"]  = { fg = c.header_6, bold = true },
    ["@markup.italic"]              = { italic = true },
    ["@markup.link"]                = "Underlined",
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
    ["@number"]                     = "Number",
    ["@number.float"]               = "Float",
    ["@operator"]                   = { fg = Util.blend_fg(c.blue_green_2, 0.6) }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@parameter"]                  = "Identifier",
    ["@preproc"]                    = "PreProc",
    ["@property"]                   = { fg = c.blue_green }, -- Main branch uses blue_green for properties
    ["@punctuation.bracket"]        = "Delimiter",
    ["@punctuation.delimiter"]      = "Delimiter",
    ["@punctuation.special"]        = "Delimiter",
    ["@string"]                     = "String",
    ["@string.documentation"]       = { fg = c.yellow },
    ["@string.escape"]              = { fg = c.purple_2 }, -- For escape characters within a string.
    ["@string.regexp"]              = { fg = c.cyan },     -- For regexes.
    ["@string.special"]             = "SpecialChar",
    ["@string.special.symbol"]      = "Identifier",
    ["@string.special.url"]         = "Keyword",
    ["@tag"]                        = "Label",
    ["@tag.attribute"]              = "Identifier",
    ["@tag.delimiter"]              = "Delimiter",
    ["@type"]                       = "Type",
    ["@type.builtin"]               = "Type",
    ["@type.definition"]            = "Typedef",
    ["@type.qualifier"]             = "@keyword",
    ["@variable"]                   = { fg = c.fg },                             -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { fg = c.pink },                           -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.parameter"]         = { fg = c.blue_green },                     -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = Util.blend_fg(c.blue_green, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ["@variable.parameter.lua"]     = { fg = c.pink },
  }

  return ret
end

return M

