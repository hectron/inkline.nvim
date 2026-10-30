# Animated demo for the README. Render with `make demo` (needs vhs, ttyd, ffmpeg, nvim).
Output assets/demo.gif

Set Shell bash
Set FontSize 18
Set Width 1300
Set Height 760
Set Padding 0
Set TypingSpeed 60ms

Hide
Type "nvim --clean -u NONE --cmd 'set rtp^=.' -c 'set termguicolors number cursorline laststatus=0 noshowmode noruler shortmess+=I' -c 'colorscheme inkline' scripts/sample.lua"
Enter
Sleep 1.5s
Show

Sleep 2s
Type "13GVjjj"
Sleep 1.5s
Escape
Type "/STYLES"
Enter
Sleep 1.5s

Type ":colorscheme inkline-retro"
Enter
Sleep 2.5s

Type ":colorscheme inkline-cyberpunk"
Enter
Sleep 2.5s

Type ":colorscheme inkline-original"
Enter
Sleep 2s
