#!/bin/bash

export PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

# Active theme identifier (persisted for toggling)
export OX_THEME="dark"

# Dark palette (cyberdream)
export OX_BG_DARK="0xff16181a"
export OX_FG_DARK="0xffe0e0e0"
export OX_DIM_DARK="0xff7b8496"
export OX_MG_DARK="0xffff5ef1"
export OX_ORG_DARK="0xff5ef1ff"
export OX_BORDER_DARK="0xff2a3a4a"

# Light palette
export OX_BG_LIGHT="0xfff5f5f5"
export OX_FG_LIGHT="0xff2d2d2d"
export OX_DIM_LIGHT="0xff666666"
export OX_MG_LIGHT="0xff007acc"
export OX_ORG_LIGHT="0xff0080ff"
export OX_BORDER_LIGHT="0xffd0d0d0"

if [[ "$OX_THEME" == "light" ]]; then
  export OX_BG="$OX_BG_LIGHT"
  export OX_FG="$OX_FG_LIGHT"
  export OX_DIM="$OX_DIM_LIGHT"
  export OX_MG="$OX_MG_LIGHT"
  export OX_ORG="$OX_ORG_LIGHT"
  export OX_BORDER="$OX_BORDER_LIGHT"
else
  export OX_THEME="dark"
  export OX_BG="$OX_BG_DARK"
  export OX_FG="$OX_FG_DARK"
  export OX_DIM="$OX_DIM_DARK"
  export OX_MG="$OX_MG_DARK"
  export OX_ORG="$OX_ORG_DARK"
  export OX_BORDER="$OX_BORDER_DARK"
fi

export SB_BAR=(
  position=left
  height=60
  sticky=on
  topmost=off
  shadow=on
  y_offset=5
  margin=5
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
