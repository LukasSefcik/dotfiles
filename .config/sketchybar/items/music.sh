#!/bin/bash

music=(
  script="$PLUGIN_DIR/music.sh"
  updates=on
)

sketchybar --add item music center \
           --set music "${music[@]}" \
                 icon.font="sketchybar-app-font:Regular:14.0" \
                 icon=":music:" \
           --subscribe music media_change
