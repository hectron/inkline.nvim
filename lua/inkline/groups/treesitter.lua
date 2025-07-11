local Util = require("inkline.util")

local M = {}

function M.get(c, opts)
  local property_mapping = require("inkline.colors.property_mapping")
  local property_color = property_mapping.get_property_color(opts.style, c)

  -- stylua: ignore
  local ret = {
    ["@annotation"]                   = "PreProc",
    ["@attribute"]                    = "PreProc",
    ["@boolean"]                      = "Boolean",
    ["@boolean.lua"]                  = { fg = c.orange },
    ["@character"]                    = "Character",
    ["@character.printf"]             = "SpecialChar",
    ["@character.special"]            = "SpecialChar",
    ["@comment"]                      = { fg = opts.purple_comments and c.purple or c.dark_grey_5, italic = true },
    ["@comment.error"]                = { fg = c.error },
    ["@comment.hint"]                 = { fg = c.hint },
    ["@comment.info"]                 = { fg = c.info },
    ["@comment.note"]                 = { fg = c.hint },
    ["@comment.todo"]                 = { fg = c.todo },
    ["@comment.warning"]              = { fg = c.warning },
    ["@constant"]                     = { fg = c.constant_color },
    ["@constant.lua"]                 = { fg = c.constant_color },
    ["@constant.builtin"]             = "Special",
    ["@constant.macro"]               = "Define",
    ["@constructor"]                  = { fg = c.purple_3 }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@diff.delta"]                   = { fg = c.yellow, bold = true },
    ["@diff.minus"]                   = { fg = c.red, bold = true },
    ["@diff.plus"]                    = { fg = c.green, bold = true },
    ["@function"]                     = { fg = c.function_color },
    ["@function.builtin"]             = { fg = c.function_color, bold = true },
    ["@function.call"]                = { fg = c.function_color },
    ["@function.macro"]               = { fg = c.function_color, italic = true },
    ["@function.method"]              = { fg = c.function_color },
    ["@function.method.call"]         = { fg = c.function_color },
    ["@keyword"]                      = { fg = c.keyword }, -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"]          = { fg = c.keyword },
    ["@keyword.coroutine"]            = { fg = c.keyword },
    ["@keyword.debug"]                = { fg = c.keyword },
    ["@keyword.directive"]            = { fg = c.keyword },
    ["@keyword.directive.define"]     = { fg = c.keyword },
    ["@keyword.exception"]            = { fg = c.keyword },
    ["@keyword.function"]             = { fg = c.keyword }, -- For keywords used to define a function.
    ["@keyword.import"]               = "Include",
    ["@keyword.operator"]             = "@operator",
    ["@keyword.operator.lua"]         = "Statement",
    ["@keyword.repeat"]               = "Repeat",
    ["@keyword.return"]               = "@keyword",
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
    ["@number"]                       = "Number",
    ["@number.float"]                 = "Float",
    ["@operator"]                     = { fg = Util.blend_fg(c.blue_green_2, 0.6) }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"]                     = { fg = property_color },
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
    ["@type.definition"]              = { fg = c.type_color },
    ["@type.qualifier"]               = { fg = c.keyword },
    ["@variable"]                     = { fg = c.variable_color },                 -- Any variable name that does not have another highlight.
    ["@variable.builtin"]             = { fg = c.pink, italic = true },            -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.parameter"]           = { fg = c.blue_green },                     -- For parameters of a function.
    ["@variable.parameter.builtin"]   = { fg = Util.blend_fg(c.blue_green, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    ["@variable.parameter.lua"]       = { fg = c.pink },

    -- Git commit specific highlights
    ["@comment.gitcommit"]            = { fg = opts.purple_comments and c.purple or c.dark_grey_5, italic = true },
    ["@string.gitcommit"]             = { fg = c.string_color },
    ["@keyword.gitcommit"]            = { fg = c.keyword },
  }

  return ret
end

return M
