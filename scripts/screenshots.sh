#!/usr/bin/env bash
# Render a screenshot per style: headless Neovim in tmux -> ANSI capture -> freeze PNG.
# Usage: scripts/screenshots.sh [output-dir]   (requires nvim, tmux, freeze)
set -euo pipefail

cd "$(dirname "$0")/.."
out=${1:-assets}
mkdir -p "$out"
sock="inkline-shots-$$"
capture=$(mktemp)
trap 'tmux -L "$sock" kill-server 2>/dev/null || true; rm -f "$capture"' EXIT

for style in original retro cyberpunk; do
  tmux -L "$sock" -f /dev/null new-session -d -x 100 -y 31 \
    "nvim --clean -u NONE --cmd 'set rtp^=$PWD' \
      -c 'set termguicolors number cursorline laststatus=0 noruler noshowcmd shortmess+=F' \
      -c 'lua require(\"inkline\").setup({ style = \"$style\" })' \
      -c 'colorscheme inkline' -c 'normal! 14G' scripts/sample.lua" \; \
    set -g default-terminal tmux-256color \; set -ga terminal-overrides ',*:Tc'
  sleep 1.5
  tmux -L "$sock" capture-pane -ep >"$capture"
  tmux -L "$sock" kill-server
  # freeze drops the foreground when italics start without a color code, so repeat the current color
  perl -pe 'BEGIN { $fg = "" } s/(\e\[0m)|(\e\[38;2;[\d;]+m)|(\e\[3m)/defined $1 ? ($fg = "", $1)[1] : defined $2 ? ($fg = $2) : "$3$fg"/ge' "$capture" |
    freeze --language ansi --background "#000000" --padding 20 -o "$out/$style.png" >/dev/null
  echo "wrote $out/$style.png"
done
