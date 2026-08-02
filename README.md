# SeaShells

A dark blue/orange color theme for Neovim, implemented in Lua. It is based on the original [iTerm2 SeaShells theme](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master) and keeps the source Alacritty palette in [extras/alacritty.toml](extras/alacritty.toml) for reference.

## Usage

Add this repository to your Neovim runtime path with your plugin manager, then load:

```vim
colorscheme SeaShells
```

## Configuration

The default configuration uses a transparent editor background. Override [lua/SeaShells/config.lua](lua/SeaShells/config.lua) before loading the colorscheme if you want an opaque SeaShells background.

## Todo

- improve the colour choice for dark colours (not suitable for a transparent window)
- improve treesitter elements
- Fine tune the colours for every neovim element
- telescope
- nvim-cmp
