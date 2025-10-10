#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
. "$CONFIG_DIR/globals.sh"

ICONS_FILE="$CONFIG_DIR/icons.sh"
if [[ -f "$ICONS_FILE" ]]; then
  . "$ICONS_FILE"
fi

# Resolve current application name from event info or via System Events
APP_NAME="$INFO"

# Extract app value if INFO payload is JSON (e.g., window_change events)
if [[ "$APP_NAME" == *'"app"'* ]]; then
  JSON_APP=$(printf "%s" "$APP_NAME" | sed -n 's/.*"app":"\([^"]*\)".*/\1/p')
  if [[ -n "$JSON_APP" ]]; then
    APP_NAME="$JSON_APP"
  fi
fi

if [[ -z "$APP_NAME" ]]; then
  APP_NAME=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)
fi

if [[ -z "$APP_NAME" ]]; then
  APP_NAME="Finder"
fi

APP_NAME=$(printf "%s" "$APP_NAME" | sed -e 's/^ *//' -e 's/ *$//')

if [[ -z "$APP_NAME" ]]; then
  APP_NAME="Finder"
fi

ICON_LOOKUP=$(printf "%s" "$APP_NAME" | tr '[:lower:]' '[:upper:]' | tr ' ' '_' | tr -cd 'A-Z0-9_')
ICON_VALUE=""

if [[ -n "$ICON_LOOKUP" ]]; then
  ICON_VALUE="${!ICON_LOOKUP}"
fi

if [[ -z "$ICON_VALUE" ]]; then
  ICON_VALUE="$APPLE"
fi

sketchybar --set "$NAME" \
  icon="$ICON_VALUE" \
  icon.color="$OX_FG" \
  icon.drawing=on \
  label.drawing=off
