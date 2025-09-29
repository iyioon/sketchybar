#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
. "$CONFIG_DIR/globals.sh"

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

MAX_CHARS=48
APP_NAME=$(printf "%s" "$APP_NAME" | sed -e 's/^ *//' -e 's/ *$//')
APP_NAME=${APP_NAME:0:$MAX_CHARS}

if [[ -z "$APP_NAME" ]]; then
  APP_NAME="Finder"
fi

sketchybar --set "$NAME" \
  icon.drawing=off \
  label="${APP_NAME}" \
  label.color="$OX_FG" \
  label.alignment=center
