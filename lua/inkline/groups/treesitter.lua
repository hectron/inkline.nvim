
local Util = require("inkline.util")

local M = {}

function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    ["@annotation"]                 = "PreProc",
    ["@attribute"]                  = "PreProc",
    ["@boolean"]                    = "Boolean",
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
    ["@keyword.repeat"]             = "Repeat",
    ["@keyword.return"]             = "@keyword",
    ["@keyword.storage"]            = "StorageClass",
    ["@label"]                      = { fg = c.light_blue }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"]                     = "@none",
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    ["@markup.heading"]             = "Title",
    ["@markup.italic"]              = { italic = true },
    ["@markup.link"]                = { fg = c.teal },
    ["@markup.link.label"]          = "SpecialChar",
    ["@markup.link.label.symbol"]   = "Identifier",
    ["@markup.link.url"]            = "Underlined",
    ["@markup.list"]                = { fg = c.blue_green_2 }, -- For special punctutation that does not fall in the categories before.
    ["@markup.list.checked"]        = { fg = c.green }, -- For brackets and parens.
    ["@markup.list.markdown"]       = { fg = c.orange_2, bold = true },
    ["@markup.list.unchecked"]      = { fg = c.light_blue }, -- For brackets and parens.
    ["@markup.math"]                = "Special",
    ["@markup.raw"]                 = "String",
    ["@markup.raw.markdown_inline"] = { bg = c.bg_highlight, fg = c.light_orange },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.strong"]              = { bold = true },
    ["@markup.underline"]           = { underline = true },
    ["@module"]                     = "Directory",
    ["@module.builtin"]             = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"]          = "@variable.builtin",
    ["@none"]                       = {},
    ["@number"]                     = "Number",
    ["@number.float"]               = "Float",
    ["@operator"]                   = { fg = Util.blend_fg(c.blue_green_2, 0.6) }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"]                   = { fg = c.blue_green },
    ["@punctuation.bracket"]        = { fg = c.dark_white }, -- For brackets and parens.
    ["@punctuation.delimiter"]      = { fg = c.blue_green_2 }, -- For delimiters ie: `.`
    ["@punctuation.special"]        = { fg = c.blue_green_2 }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"] = { fg = c.orange }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@string"]                     = "String",
    ["@string.documentation"]       = { fg = c.yellow },
    ["@string.escape"]              = { fg = c.purple_2 }, -- For escape characters within a string.
    ["@string.regexp"]              = { fg = c.cyan }, -- For regexes.
    ["@tag"]                        = "Label",
    ["@tag.attribute"]              = "@property",
    ["@tag.delimiter"]              = "Delimiter",
    ["@type"]                       = "Type",
    ["@type.definition"]            = "Typedef",
    ["@type.qualifier"]             = "@keyword",
    ["@variable"]                   = { fg = c.fg }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { fg = c.pink }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.parameter"]         = { fg = c.blue_green }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = Util.blend_fg(c.blue_green, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ["@variable.parameter.lua"]     = { fg = c.white },
  }

  -- for i, color in ipairs(c.rainbow) do
  --   ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
  -- end
  return ret
end

return M
