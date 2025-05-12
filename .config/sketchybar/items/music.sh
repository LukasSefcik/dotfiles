#!/bin/bash

music=(
  script="$PLUGIN_DIR/music.sh"
  updates=on
)

sketchybar --add item music right \
           --set music "${music[@]}" \
                 icon.font="sketchybar-app-font:Regular:14.0" \
                 icon=":music:" \
                 label.max_chars=22 \
                 scroll_texts=on \
           --subscribe music media_change
