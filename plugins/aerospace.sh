#!/usr/bin/env bash
source "$HOME/.config/sketchybar/globals.sh"

sid="$1"
win_count=$(aerospace list-windows --workspace "$sid" 2>/dev/null | wc -l | tr -d ' ')

# Nerd Font circle icons (all same baseline/size)
ACTIVE_ICON=""   # solid circle
OCCUPIED_ICON="" # dot-circle
EMPTY_ICON=""    # thin circle

# Decide state
if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
  icon="$ACTIVE_ICON"; icon_color="$OX_MG"
elif [ "${win_count:-0}" -gt 0 ]; then
  icon="$OCCUPIED_ICON"; icon_color="$OX_DIM"
else
  icon="$EMPTY_ICON"; icon_color="$OX_DIM"
fi

sketchybar --set "$NAME" \
  icon="$icon" \
  icon.color="$icon_color" \
  label="$sid" \
  label.color="$OX_FG" \
  background.drawing=off
