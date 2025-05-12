#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"

update_space_icons() {
    local sid=$1
    local windows=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    sketchybar --set space.$sid drawing=on

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

    sketchybar --set space.$sid label="$icon_strip" label.padding_right=$label_padding_right
}

# Update all workspaces to ensure clean state
for sid in $(aerospace list-workspaces --all); do
    update_space_icons "$sid"
done
