# Contributing to inkline.nvim

Setup, commands, and where code goes are in `AGENTS.md`. This file covers how inkline is built and why, so changes stay consistent.

## Loading

- `load()` follows the order Neovim expects from a colorscheme: `hi clear`, `background=dark`, `g:colors_name`, then highlights. `hi clear` resets `g:colors_name`, so it must be set afterwards.
- Every style needs a file in `colors/`. `:colorscheme` and colorscheme pickers such as Telescope only find styles that have one.
- `setup()` only stores options. It must not set highlights, create autocmds, or require heavy modules, because users call it during startup and may call it more than once.
- Autocmds that `load()` creates go in the `inkline` augroup, which is cleared on each load and when another colorscheme loads.
- `require("inkline.theme").setup()` returns highlights and colors without touching editor state. Keep it that way; tests and tools rely on it.

## Highlights

- Prefer a link (a string value) when a group should always match another group. Use a table when it needs its own color.
- Use the palette, not hex values, in group files. A computed key such as `comment` or `string_color` is how an option changes a color.
- Tree-sitter captures fall back to their parent (`@function.call` uses `@function`). Define the parent, and only define a child when it needs a different color.
- Once a group is defined, keep it, even if it now matches its parent. Removing it changes what user overrides of the parent affect.
- Plugin groups stay in their own file so `plugins = { name = false }` can turn them off.

## Customization

- `on_colors` runs once per load before groups are built. `on_highlights` runs once after. Both may modify their table or return a new one.
- New options need a default in `config.lua`, validation in `M.validate`, a line in `README.md`, and an entry in `doc/inkline.txt`.

## Performance

- Building every group takes about 0.015 ms, so inkline doesn't cache. Measure before adding a cache or any other optimization.
- Apply highlights with `nvim_set_hl`, not `:highlight` commands.

## Testing

- Tests use mini.test with a child Neovim per case (`tests/helpers.lua`).
- `tests/snapshots/` records the final definition of every group per style and option set. A change that alters colors shows up there as a text diff; review it like code.
- Add a test with each fix, and check that it fails without the fix.

## Compatibility

inkline 2.x keeps 2.1's options and API. Changes that break them, such as no longer turning on `termguicolors` or removing unused palette keys, wait for 3.0.
