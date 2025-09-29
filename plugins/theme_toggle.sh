#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
GLOBALS_FILE="$CONFIG_DIR/globals.sh"

# Load theme palette variables
. "$GLOBALS_FILE"

if [[ "$OX_THEME" == "dark" ]]; then
    ICON="󰔎"
    NEXT_THEME="light"
else
    ICON="󰔎"
    NEXT_THEME="dark"
fi

if [[ "$SENDER" == "mouse.clicked" ]]; then
    if [[ "$NEXT_THEME" == "light" ]]; then
        sed -i '' 's/^export OX_THEME="dark"/export OX_THEME="light"/' "$GLOBALS_FILE"
    else
        sed -i '' 's/^export OX_THEME="light"/export OX_THEME="dark"/' "$GLOBALS_FILE"
    fi

    sketchybar --reload
    exit 0
fi

sketchybar --set theme_toggle icon="$ICON"