#!/bin/bash

sketchybar --add event aerospace_workspace_change

# Získame všetky workspaces z aerospace
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
               --subscribe space.$sid aerospace_workspace_change \
               --set space.$sid \
                     icon=$sid \
                     icon.font="SF Pro:Regular:14.0" \
                     background.border_color=0xffffa500 \
                     background.border_width=1 \
                     background.color=0x44ffffff \
                     background.corner_radius=5 \
                     background.height=22 \
                     background.drawing=off \
                     label.font="sketchybar-app-font:Regular:13.0" \
                     click_script="aerospace workspace $sid" \
                     script="$PLUGIN_DIR/space_windows.sh $sid"
done
