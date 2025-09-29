#!/bin/bash

export PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
export OX_BG="0xff1b2735"   # deep navy background
export OX_FG="0xffa3d5ff"   # light cyan-blue foreground
export OX_DIM="0xff4a90e2"  # medium glossy blue
export OX_MG="0xff5ac8fa"   # aqua blue (macOS accent style)
export OX_ORG="0xff82e0ff"  # soft electric blue
export OX_BORDER="0xff2a3a4a"   # dark bluish-grey

export SB_BAR=(
  position=left
  height=60
  sticky=on
  topmost=off
  shadow=on
  y_offset=10
  margin=10
  padding_left=16
  padding_right=16
  color="$OX_BG"
  border_color="$OX_BORDER"
  border_width=1
  corner_radius=10
  font_smoothing=on
)

export SB_DEFAULT=(
  icon.font.family="Hack Nerd Font Mono"
  icon.font.style="Regular"
  icon.font.size=13
  icon.color="$OX_DIM"
  label.font="Source Code Pro"
  label.font.style="Regular"
  label.font.size=13
  label.color="$OX_MG"
  padding_left=10
  padding_right=10
  icon.padding_right=4
  icon.highlight_color="$OX_MG"
)
