#!/bin/bash

# sketchybar --add item clock right \
#            --set clock update_freq=30 \
#                       icon= \
#                       script="$PLUGIN_DIR/clock.sh"

calendar=(
  icon.font="SF PRO:Regular:12.0"
  label.font="SF PRO:Bold:14.0"
  label.align=right
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke