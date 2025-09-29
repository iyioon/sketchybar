#!/usr/bin/env bash
source "$HOME/.config/sketchybar/globals.sh"

sid="$1"

# --- label mapping (first 3 spaces use icons; others use the number) ---
case "$sid" in
  1) LABEL="" ;;
  2) LABEL="" ;;
  3) LABEL="" ;; 
  *) LABEL="$sid" ;;
esac

# --- workspace state (icon slot) ---
# Count windows in this workspace
win_count=$(aerospace list-windows --workspace "$sid" 2>/dev/null | wc -l | tr -d ' ')

ACTIVE_ICON=""   # solid circle (focused)
OCC_ICON=""      # dot-circle  (has windows)
EMPTY_ICON=""    # thin circle (empty)

if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
  ICON="$ACTIVE_ICON"; ICON_COLOR="$OX_MG"     # accent for focused
elif [ "${win_count:-0}" -gt 0 ]; then
  ICON="$OCC_ICON";   ICON_COLOR="$OX_DIM"     # dim for occupied
else
  ICON="$EMPTY_ICON"; ICON_COLOR="$OX_DIM"     # dim for empty
fi

# --- apply ---
sketchybar --set "$NAME" \
  label="$LABEL"           label.color="$OX_FG" \
  icon="$ICON"             icon.color="$ICON_COLOR" \
  background.drawing=off
