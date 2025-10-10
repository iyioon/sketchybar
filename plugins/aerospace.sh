#!/usr/bin/env bash
source "$HOME/.config/sketchybar/globals.sh"

sid="$1"

# --- label mapping (first 3 spaces use icons; others use the number) ---
case "$sid" in
  1) LABEL="󰍹" ;;
  2) LABEL="" ;;
  3) LABEL="" ;; 
  4) LABEL="󰽺" ;;
  *) LABEL="$sid" ;;
esac

# --- workspace state ---
# Count windows in this workspace
win_count=$(aerospace list-windows --workspace "$sid" 2>/dev/null | wc -l | tr -d ' ')

if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
  LABEL_COLOR="$OX_MG"        # accent for focused workspace
elif [ "${win_count:-0}" -gt 0 ]; then
  LABEL_COLOR="$OX_FG"        # foreground for occupied workspace
else
  LABEL_COLOR="$OX_DIM"       # dim for empty workspace
fi

# --- apply ---
sketchybar --set "$NAME" \
  label="$LABEL" \
  label.color="$LABEL_COLOR" \
  label.align=center \
  label.font.size=15 \
  icon.drawing=off \
  icon.padding_left=0 \
  icon.padding_right=0 \
  background.drawing=off
