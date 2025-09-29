#!/usr/bin/env bash

source "$HOME/.config/sketchybar/globals.sh"

case "$SENDER" in
  routine|forced|system_woke|mouse.clicked|mouse.entered|mouse.exited)
    cores=$(sysctl -n hw.logicalcpu 2>/dev/null)
    if [ -z "$cores" ] || [ "$cores" -lt 1 ]; then
      cores=1
    fi

    cpu_usage=$(ps -A -o %cpu | awk -v cores="$cores" 'NR>1 {sum+=$1} END {if (cores<1) cores=1; printf "%0.f", sum/cores}')

    if [ -z "$cpu_usage" ]; then
      cpu_usage=0
    fi

    sketchybar --set "$NAME" \
      icon="􀫥" \
      icon.color="$OX_FG" \
      label="${cpu_usage}%" \
      label.color="$OX_FG"
    ;;
esac
