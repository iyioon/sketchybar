# SketchyBar

> [!Info] About
> Config for SketchyBar, a highly customizable menu bar for macOS
> [Documentation](https://felixkratz.github.io/SketchyBar/setup)

## Installation

```bash
brew tap FelixKratz/formulae
brew install sketchybar
```

Also make sure to have dependencies installed:

```bash
brew install --cask font-hack-nerd-font
```

Copy over the config file:

```bash
git clone https://github.com/iyioon/sketchybar.git "${XDG_CONFIG_HOME:-$HOME/.config}"/sketchybar
```

Run the bar automatically at startup:

```bash
brew services start sketchybar
```

## Plugins

When you use/create additional plugins, make sure that they are made executable via

```bash
chmod +x name/of/plugin.sh
```

## Customization

Refer to this [discussion](https://github.com/FelixKratz/SketchyBar/discussions/47?sort=top)
