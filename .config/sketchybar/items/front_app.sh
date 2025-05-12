#!/bin/bash

sketchybar --add item chevron left \
           --set chevron icon=$CHEVRON_RIGHT label.drawing=off icon.drawing=off \
           --add item front_app center \
           --set front_app icon.font="sketchybar-app-font:Regular:14.0" \
                           script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
