# inkline.nvim

inkline is a dark-theme early 2000s aesthetic theme written in Lua, ported from TextMate's **vibrant-ink** theme.

![image](https://github.com/user-attachments/assets/394ad090-bbd6-443b-a53f-b4eac5437508)

## Features

- Supports the latest [Neovim][neovim] 0.11.0 features
- Terminal colors
- Supports most major plugins

## Requirements

- [Neovim][neovim] >= [0.11.0](https://github.com/neovim/neovim/releases/tag/v0.11.0)

## Installation

Install with whatever plugin manager you use, and call the `require("inkline").setup(opts)` function

Example installing via Lazy:

```lua
{
    "hectron/inkline.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}
```

## Usage

Via the Neovim lua API:

```lua
vim.cmd([[colorscheme inkline]])
```

Via a comand:

```vim
colorscheme inkline
```

## Customization

You can customize colors and highlight groups using callback functions:

### Modify colors
```lua
require("inkline").setup({
  on_colors = function(colors)
    colors.purple = "#ff00ff"  -- Make purple more vibrant
    return colors
  end
})
```

### Modify highlight groups
```lua
require("inkline").setup({
  on_highlights = function(highlights, colors)
    highlights.Comment = { fg = "#888888", italic = true }
    highlights.String = { fg = "#00ff00" }
    return highlights
  end
})
```

### Treesitter highlights
Use the `@` prefix for treesitter groups:
```lua
require("inkline").setup({
  on_highlights = function(highlights, colors)
    highlights["@string"] = { fg = "#66ff00" }
    highlights["@comment"] = { fg = "#888888", italic = true }
    highlights["@keyword"] = { fg = "#ff6600", bold = true }
    return highlights
  end
})
```

## Development

### Running Tests

To run the test suite:

```bash
nvim -l tests/minit.lua
```

Tests will run silently and only report failures. Exit code 0 indicates all tests passed, exit code 1 indicates failures.

[neovim]: https://github.com/neovim/neovim
