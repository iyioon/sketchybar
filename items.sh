#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
. "$CONFIG_DIR/globals.sh"

sb_separator() {
	sepName="sep$RANDOM"
	sketchybar \
		--add item "$sepName" "$1" \
		--set "$sepName" \
		\
		label="───────" \
		padding_left="$2" \
		padding_right="$3" \
		icon.drawing=off \
		label.font.size=9.0 \
		label.color="$OX_DIM"
}

sb_clock() {
  sketchybar \
    --add item clock.time "$1" \
    --add item clock.ampm "$1" \
    \
    --set clock.time  update_freq=10 icon.drawing=off label.font.size=14.0 script="$PLUGIN_DIR/clock_time.sh" \
    --set clock.ampm  update_freq=10 icon.drawing=off label.font.size=9.0  padding_left=0 padding_right=0 script="$PLUGIN_DIR/clock_ampm.sh"
}

sb_date() {
	sketchybar \
		--add item day "$1" --set day update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%a')" \
		--add item date "$1" --set date update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%d' | sed s/^0//)" \
		--add item month "$1" --set month update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%b')"
}

sb_battery() {
	sketchybar \
		--add item battery "$1" \
		--subscribe battery system_woke power_source_change \
		--set battery \
		\
		script="$PLUGIN_DIR/battery.sh" \
		update_freq=120 \
		label.color=$OX_DIM
}

sb_volume() {
	sketchybar \
		--add item volume "$1" \
		--subscribe volume volume_change \
		--set volume \
		\
		script="$PLUGIN_DIR/volume.sh" \
		label.color=$OX_DIM
}

sb_spaces() {
  sketchybar --add event aerospace_workspace_change

  for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid "$1" \
      --subscribe space.$sid aerospace_workspace_change \
      --set space.$sid \
        icon.drawing=on \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
  done
}

