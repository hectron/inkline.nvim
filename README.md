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

### Style Variants

inkline.nvim comes with multiple style variants:

- `original` (default) - Faithful port of TextMate's vibrant-ink theme 
- `modern` - Contemporary colors with purple properties and bright orange constants
- `retro` - Softer early 2000s aesthetic with pink properties and warm yellow constants  
- `classic` - Original vibrant-ink port with teal properties and yellow constants
- `cyberpunk` - Electric neon colors with cyan functions and matrix green constants

#### Via Lua Setup

```lua
require("inkline").setup({
  style = "original", -- "original", "modern", "retro", "classic", or "cyberpunk"
})
require("inkline").load()
```

#### Via Colorscheme Command

```lua
vim.cmd([[colorscheme inkline]]) -- Uses default "original" style
```

```vim
colorscheme inkline
```

#### Runtime Style Switching

```lua
require("inkline").switch_style("retro")
require("inkline").switch_style("cyberpunk")
```

## Configuration Options

inkline.nvim supports several configuration options:

```lua
require("inkline").setup({
  style = "original",           -- Style variant
  dim_inactive_windows = true,  -- Dim inactive windows
  transparent = false,          -- Transparent background
  purple_comments = false,      -- Use purple for comments
  vibrant_strings = true,       -- Use vibrant green for strings  
  cache = true,                 -- Enable caching for better performance
  on_colors = function(colors) end,      -- Customize colors
  on_highlights = function(hl, c) end,   -- Customize highlights
})
```

### Performance Caching

inkline.nvim includes a high-performance caching system that stores pre-computed highlight groups:

- **Enabled by default** (`cache = true`)
- **Cache location**: `~/.cache/nvim/inkline-{style}.json`
- **Auto-invalidation**: Automatically detects config changes
- **Significant speedup**: Faster theme loading on subsequent startups
- **Manual clearing**: `require("inkline").clear_cache()`

The cache is automatically invalidated when you change any configuration options, ensuring you always see your latest customizations.

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
