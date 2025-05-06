#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"

update_space_icons() {
    local sid=$1
    local windows=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
    echo "Workspace $sid windows: $windows"

    sketchybar --set space.$sid drawing=on

    icon_strip=" "
    if [ -n "$windows" ]; then
        while read -r app; do
            if [ -n "$app" ]; then
                icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
                echo "App: $app, Icon: $icon"
                icon_strip+=" $icon"
            fi
        done <<< "$windows"
    else
        icon_strip="—"
    fi

    echo "Final icon strip for workspace $sid: $icon_strip"
    sketchybar --set space.$sid label="$icon_strip"
}

echo "Starting workspace icon update..."
# Update all workspaces to ensure clean state
for sid in $(aerospace list-workspaces --all); do
    update_space_icons "$sid"
done
echo "Workspace icon update completed."