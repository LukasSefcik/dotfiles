#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME label="$INFO" \
                         icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")" \
                         icon.padding_left=8 \
                         label.padding_right=8 \
                         background.color=0x44ffa500 \
                         background.drawing=off \
                         background.height=22 \
                         background.corner_radius=5 \
                         background.border_color=0xffffa500 \
                         background.border_width=1
fi
