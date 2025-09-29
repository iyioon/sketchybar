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
  # HOURS
  sketchybar --add item clock.hh left \
             --set clock.hh \
               script="$PLUGIN_DIR/clock.sh" update_freq=30 \
               drawing=on icon.drawing=off label.drawing=on \
               label.font.size=30 label.color="$OX_FG" \
               padding_left=0 padding_right=5 \
               y_offset=0

  # MINUTES
  sketchybar --add item clock.mm left \
             --set clock.mm \
               script="$PLUGIN_DIR/clock.sh" update_freq=30 \
               drawing=on icon.drawing=off label.drawing=on \
               label.font.size=22 label.color="$OX_FG" \
               padding_left=0 padding_right=10 \
               y_offset=0

  # AM/PM  (make it clearly visible first)
  sketchybar --add item clock.ap left \
             --set clock.ap \
               script="$PLUGIN_DIR/clock.sh" update_freq=30 \
               drawing=on icon.drawing=off label.drawing=on \
               label.font.size=12 label.color="$OX_FG" \
               padding_left=0 padding_right=0 \
               y_offset=0

  # Group them so there's no extra spacing between the three
  sketchybar --add bracket clock_group clock.hh clock.mm clock.ap \
             --set clock_group background.drawing=off
}

sb_date() {
	  sketchybar \
	    --add item day "$1"   --set day   update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%a')" label.color="$OX_FG" \
	    --add item date "$1"  --set date  update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%d' | sed s/^0//)" label.color="$OX_FG" \
	    --add item month "$1" --set month update_freq=120 icon.drawing=off padding_right=4 label="$(date '+%b')" label.color="$OX_FG"
}

sb_battery() {
  sketchybar \
    --add item battery "$1" \
    --subscribe battery system_woke power_source_change \
    --set battery \
      script="$PLUGIN_DIR/battery.sh" \
      update_freq=120 \
      label.color=$OX_FG \
      icon.color=$OX_FG
}

sb_volume() {
  sketchybar \
    --add item volume "$1" \
    --subscribe volume volume_change \
    --set volume \
      script="$PLUGIN_DIR/volume.sh" \
      label.color=$OX_FG \
      icon.color=$OX_FG
}

sb_spaces() {
  sketchybar --add event aerospace_workspace_change

  for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid "$1" \
      --subscribe space.$sid aerospace_workspace_change \
      --set space.$sid \
        icon.drawing=on \
	label.font.family="Hack Nerd Font Mono" \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
  done
}

sb_theme_toggle() {
  sketchybar \
    --add item theme_toggle "$1" \
    --set theme_toggle \
      script="$PLUGIN_DIR/theme_toggle.sh" \
      click_script="SENDER=mouse.clicked $PLUGIN_DIR/theme_toggle.sh" \
      icon.color=$OX_FG \
      icon.font.size=25 \
  icon.padding_left=0 \
  icon.padding_right=0 \
      label.drawing=off \
      padding_left=8 \
      padding_right=8
}

