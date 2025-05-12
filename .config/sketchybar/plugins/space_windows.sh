#!/bin/bash

# id workspace príde ako parameter
space_number=$1

# Získame a zobrazíme ikony aplikácií pre tento space
windows=$(aerospace list-windows --workspace "$space_number")

icon_strip=""
label_padding_right=4

if [ -n "$windows" ]; then
    while read -r window; do
        app=$(echo "$window" | cut -d'|' -f2 | xargs)
        if [ -n "$app" ]; then
            icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
            icon_strip+=" $icon"
        fi
    done <<< "$windows"
else
    icon_strip=""
    label_padding_right=0
fi

if [ -z "$FOCUSED_WORKSPACE" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# Nastavíme pozadie podľa toho, či je workspace aktívny
if [ "$space_number" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=off \
                             icon.color=0xffffffff \
                             label.color=0xffffffff \
                             label="$icon_strip" \
                             label.padding_left=0 \
                             label.padding_right=$label_padding_right
else
    sketchybar --set "$NAME" background.drawing=off \
                             icon.color=0x70ffffff \
                             label.color=0x50ffffff \
                             label="$icon_strip" \
                             label.padding_left=0 \
                             label.padding_right=$label_padding_right
fi

