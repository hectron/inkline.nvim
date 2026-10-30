# inkline.nvim

A Neovim colorscheme with three styles: `original`, `retro`, and `cyberpunk`. Read `CONTRIBUTING.md` for the colorscheme practices this repo follows.

## Setup

Run `mise install` (`mise.toml` pins Neovim 0.12.5, StyLua, lua-language-server, tmux, freeze, VHS, and ffmpeg). On macOS, also run `brew install ttyd`.

## Commands

- `make test`: run every test. Run it after any change.
- `make lint`: StyLua check and lua-language-server type check. Both must be clean.
- `make snapshots`: rewrite `tests/snapshots/*.txt`. Run it only for an intended color change, and review the diff.
- `make screenshots`: regenerate `assets/*.png`.
- `make demo`: regenerate `assets/demo.gif` from `scripts/demo.tape`.

## Where code goes

- Palette for a style: `lua/inkline/colors/<style>.lua`. Shared colors: `lua/inkline/colors/base.lua`.
- Editor and UI groups for every style: `lua/inkline/groups/editor.lua`.
- Syntax: `groups/syntax.lua` for classic groups, `groups/vibrant_ink.lua` for `original`'s Tree-sitter captures, and `groups/modern.lua` for `retro` and `cyberpunk`.
- A plugin touches five places:
  - `groups/plugins/<name>.lua`, shaped like `groups/plugins/flash.lua`: `M.get(c)` takes the palette and returns the plugin's groups. Take group names from the plugin's own docs or source.
  - Its name in `M.plugins` in `groups/init.lua`, kept alphabetical.
  - The plugin list under "Features" and the "Plugin names" line in `README.md`.
  - A row in the plugin table in `doc/inkline.txt`, with the plugin's `owner/repo`.
  - `make snapshots`. The new groups are added to every snapshot, including `dotfiles-retro.txt`; that is expected as long as no existing line changes.
- Palette keys are typed in the `inkline.Palette` class in `colors/base.lua`. Match the editor by reusing the colors of a similar group in `groups/editor.lua`, such as `FloatBorder` or `CursorLine`. Use `c.bg` for a window background (it becomes `none` with `transparent = true`) and `c.none` to show whatever is behind.
- A style: `M.styles` in `lua/inkline/config.lua`, `colors/<style>.lua`, `colors/inkline-<style>.lua`, `lua/lualine/themes/inkline-<style>.lua`, and a snapshot case in `tests/test_snapshots.lua`.

## Rules

- When a change alters groups the screenshots show (syntax, `Normal`, `LineNr`, `CursorLine`, `Visual`, `Search`), run `make screenshots` in the same PR and put before/after images in the PR description. Plugin groups don't appear in the screenshots.
- Snapshots are compared only on the Neovim minor version that recorded them (0.12). CI on 0.12.5 fails instead of skipping.
- braintreeps/neovim-dotfiles pins inkline and overrides some groups. `tests/test_dotfiles.lua` and `tests/snapshots/dotfiles-retro.txt` cover what it relies on; don't change them to make a failure pass.
- Don't remove a group because it currently matches its parent capture or a Neovim default. Users override parents (the dotfiles override `@markup.link`), and the child must keep its own color.
- Keep 2.x compatibility: `load()` turns on `termguicolors`, `cache` is accepted and ignored, and unused palette keys stay.
- The tests run with isolated XDG paths, where mise shims fail. The Makefile resolves the real binary with `mise which nvim`; pass `NVIM=<path>` to use another one.
- Format with StyLua. Annotate public functions with LuaCATS types. Don't add inline comments unless the code can't explain itself; `-- stylua: ignore` above an aligned group table is fine.
- Use conventional commits (`feat:`, `fix:`, `test:`, `docs:`, `build:`, `chore:`).
