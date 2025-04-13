# inkline.nvim

inkline is a dark-theme early 2000s aesthetic theme written in Lua, ported from TextMate's **vibrant-ink** theme.


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


[neovim]: https://github.com/neovim/neovim
