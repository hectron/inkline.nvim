-- Syntax for styles driven by palette roles (retro, cyberpunk)
local Util = require("inkline.util")

local M = {}

---@param c inkline.Palette
---@return inkline.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    diffAdded                  = { fg = c.green, bold = true },
    diffRemoved                = { fg = c.red, bold = true },
    diffChanged                = { fg = c.yellow, bold = true },
    diffLine                   = { fg = c.cyan, bold = true },
    diffSubname                = { fg = c.purple, italic = true },
    diffFile                   = { fg = c.light_blue, bold = true },
    diffNewFile                = { fg = c.green, bold = true },
    diffOldFile                = { fg = c.red, bold = true },

    gitcommitSummary           = { fg = c.light_blue, bold = true, underline = true },
    gitcommitOverflow          = { fg = c.red, bold = true, reverse = true },
    gitcommitComment           = { fg = c.comment, italic = true },
    gitcommitUntracked         = { fg = c.dark_grey_5 },
    gitcommitDiscarded         = { fg = c.red },
    gitcommitSelected          = { fg = c.green },
    gitcommitUnmerged          = { fg = c.yellow },
    gitcommitOnBranch          = { fg = c.cyan },
    gitcommitBranch            = { fg = c.purple, bold = true },
    gitcommitNoBranch          = { fg = c.red, bold = true },
    gitcommitHeader            = { fg = c.light_blue, bold = true },
    gitcommitFirst             = { fg = c.light_blue, bold = true, underline = true },

    ["@annotation"]                   = "PreProc",
    ["@attribute"]                    = "PreProc",
    ["@boolean.lua"]                  = { fg = c.orange },
    ["@character.printf"]             = "SpecialChar",
    ["@comment"]                      = { fg = c.comment, italic = true },
    ["@comment.error"]                = { fg = c.error },
    ["@comment.hint"]                 = { fg = c.hint },
    ["@comment.info"]                 = { fg = c.info },
    ["@comment.note"]                 = { fg = c.hint },
    ["@comment.todo"]                 = { fg = c.todo },
    ["@comment.warning"]              = { fg = c.warning },
    ["@constant"]                     = { fg = c.constant_color },
    ["@constant.lua"]                 = { fg = c.constant_color },
    ["@constant.macro"]               = "Define",
    ["@constructor"]                  = { fg = c.purple_3 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@diff.delta"]                   = { fg = c.yellow, bold = true },
    ["@diff.minus"]                   = { fg = c.red, bold = true },
    ["@diff.plus"]                    = { fg = c.green, bold = true },
    ["@function"]                     = { fg = c.function_color },
    ["@function.builtin"]             = { fg = c.function_color, bold = true },
    ["@function.macro"]               = { fg = c.function_color, italic = true },
    ["@keyword"]                      = { fg = c.keyword }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"]             = { fg = c.keyword }, -- For keywords used to define a function.
    ["@keyword.import"]               = "Include",
    ["@keyword.operator"]             = "@operator",
    ["@keyword.operator.lua"]         = "Statement",
    ["@keyword.repeat"]               = "Repeat",
    ["@keyword.storage"]              = "StorageClass",
    ["@label"]                        = { fg = c.light_blue }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"]                       = "@none",
    ["@markup.emphasis"]              = { italic = true },
    ["@markup.environment"]           = "Macro",
    ["@markup.environment.name"]      = "Type",
    ["@markup.heading"]               = { fg = c.header_1, bold = true },
    ["@markup.heading.1.markdown"]    = { fg = c.header_1, bold = true },
    ["@markup.heading.2.markdown"]    = { fg = c.header_2, bold = true },
    ["@markup.heading.3.markdown"]    = { fg = c.header_3, bold = true },
    ["@markup.heading.4.markdown"]    = { fg = c.header_4, bold = true },
    ["@markup.heading.5.markdown"]    = { fg = c.header_5, bold = true },
    ["@markup.heading.6.markdown"]    = { fg = c.header_6, bold = true },
    ["@markup.heading.gitcommit"]     = { fg = c.light_blue, bold = true, underline = true },
    ["@markup.italic"]                = { italic = true },
    ["@markup.link"]                  = { fg = c.teal },
    ["@markup.link.label"]            = "SpecialChar",
    ["@markup.link.label.symbol"]     = "Identifier",
    ["@markup.link.url"]              = "Underlined",
    ["@markup.list"]                  = { fg = c.blue_green_2 }, -- For special punctutation that does not fall in the categories before.
    ["@markup.list.checked"]          = { fg = c.green },        -- For brackets and parens.
    ["@markup.list.markdown"]         = { fg = c.orange_2, bold = true },
    ["@markup.list.unchecked"]        = { fg = c.light_blue },   -- For brackets and parens.
    ["@markup.math"]                  = "Special",
    ["@markup.raw"]                   = "String",
    ["@markup.raw.markdown_inline"]   = { bg = c.bg_highlight, fg = c.light_orange },
    ["@markup.strikethrough"]         = { strikethrough = true },
    ["@markup.strong"]                = { bold = true },
    ["@markup.underline"]             = { underline = true },
    ["@module"]                       = "Directory",
    ["@module.builtin"]               = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"]            = "@variable.builtin",
    ["@none"]                         = {},
    ["@operator"]                     = { fg = Util.blend_fg(c.blue_green_2, 0.6) }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"]                     = { fg = c.property },
    ["@punctuation.bracket"]          = { fg = c.dark_white },                       -- For brackets and parens.
    ["@punctuation.delimiter"]        = { fg = c.blue_green_2 },                     -- For delimiters ie: `.`
    ["@punctuation.special"]          = { fg = c.blue_green_2 },                     -- For special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"] = { fg = c.orange },                           -- For special symbols (e.g. `{}` in string interpolation)
    ["@string"]                       = { fg = c.string_color },
    ["@string.documentation"]         = { fg = c.string_color, italic = true },
    ["@string.escape"]                = { fg = c.purple_2 }, -- For escape characters within a string.
    ["@string.regexp"]                = { fg = c.cyan },     -- For regexes.
    ["@tag"]                          = { fg = c.keyword },
    ["@tag.attribute"]                = { fg = c.purple_2 },
    ["@tag.delimiter"]                = { fg = c.blue_green_2 },
    ["@type"]                         = { fg = c.type_color },
    ["@type.ruby"]                    = { fg = c.type_color },
    ["@type.qualifier"]               = { fg = c.keyword },
    ["@variable"]                     = { fg = c.variable_color },                 -- Any variable name that does not have another highlight.
    ["@variable.builtin"]             = { fg = c.pink, italic = true },            -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.parameter"]           = { fg = c.blue_green },                     -- For parameters of a function.
    ["@variable.parameter.builtin"]   = { fg = Util.blend_fg(c.blue_green, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ["@variable.parameter.lua"]       = { fg = c.pink },

    -- Git commit specific highlights
    ["@comment.gitcommit"]            = { fg = c.comment, italic = true },
    ["@string.gitcommit"]             = { fg = c.string_color },
    ["@keyword.gitcommit"]            = { fg = c.keyword },

    ["@lsp.type.boolean"]                        = "@boolean",
    ["@lsp.type.builtinType"]                    = "@type.builtin",
    ["@lsp.type.deriveHelper"]                   = "@attribute",
    ["@lsp.type.escapeSequence"]                 = "@string.escape",
    ["@lsp.type.formatSpecifier"]                = "@markup.list",
    ["@lsp.type.generic"]                        = "@variable",
    ["@lsp.type.lifetime"]                       = "@keyword.storage",
    ["@lsp.type.namespace.python"]               = "@variable",
    ["@lsp.type.parameter.lua"]                  = "@variable.parameter.lua",
    ["@lsp.type.selfKeyword"]                    = "@variable.builtin",
    ["@lsp.type.selfTypeKeyword"]                = "@variable.builtin",
    ["@lsp.type.typeAlias"]                      = "@type.definition",
    ["@lsp.type.unresolvedReference"]            = { undercurl = true, sp = c.error },
    ["@lsp.type.variable"]                       = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"]        = "@type.builtin",
    ["@lsp.typemod.enum.defaultLibrary"]         = "@type.builtin",
    ["@lsp.typemod.enumMember.defaultLibrary"]   = "@constant.builtin",
    ["@lsp.typemod.function.defaultLibrary"]     = "@function.builtin",
    ["@lsp.typemod.function.defaultLibrary.lua"] = { fg = c.gold },
    ["@lsp.typemod.keyword.async"]               = "@keyword.coroutine",
    ["@lsp.typemod.keyword.injected"]            = "@keyword",
    ["@lsp.typemod.macro.defaultLibrary"]        = "@function.builtin",
    ["@lsp.typemod.method.defaultLibrary"]       = "@function.builtin",
    ["@lsp.typemod.operator.injected"]           = "@operator",
    ["@lsp.typemod.parameter.declaration.lua"]   = "@variable.parameter.lua",
    ["@lsp.typemod.string.injected"]             = "@string",
    ["@lsp.typemod.struct.defaultLibrary"]       = "@type.builtin",
    ["@lsp.typemod.variable.callable"]           = "@function",
    ["@lsp.typemod.variable.defaultLibrary"]     = "@variable.builtin",
    ["@lsp.typemod.variable.injected"]           = "@variable",
    ["@lsp.typemod.variable.static"]             = "@constant",
  }
end

return M
