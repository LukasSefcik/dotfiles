#!/bin/bash

# Získame ID space z názvu položky sketchybaru
space_number=$(echo "$NAME" | sed 's/space\.//')

if [ -z "$FOCUSED_WORKSPACE" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# Nastavíme pozadie podľa toho, či je workspace aktívny
if [ "$space_number" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on \
                             icon.color=0xffffa500
else
    sketchybar --set "$NAME" background.drawing=off \
                             icon.color=0xffffffff
fi

# Získame a zobrazíme ikony aplikácií pre tento space
windows=$(aerospace list-windows --workspace "$space_number")

icon_strip=" "
if [ -n "$windows" ]; then
    while read -r window; do
        app=$(echo "$window" | cut -d'|' -f2 | xargs)
        if [ -n "$app" ]; then
            icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
            icon_strip+=" $icon"
        fi
    done <<< "$windows"
else
    icon_strip="—"
fi

sketchybar --set "$NAME" label="$icon_strip"
