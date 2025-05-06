# $ITEM_DIR/keyboard.sh
sketchybar --add item keyboard right \
           --set keyboard \
                icon= \
                script="$PLUGIN_DIR/keyboard.sh" \
                icon.padding_left=0 \
                icon.padding_right=0 \
                label.padding_left=8 \
                label.padding_right=8 \
                label.color=0xffffffff \
                background.color=0x44ffa500 \
                background.height=22 \
                background.corner_radius=5 \
                background.border_color=0xffffa500 \
                background.border_width=1 \
                click_script="osascript -e 'tell application \"System Events\" to keystroke \" \" using {control down, option down}'" \
           --add event keyboard_change "AppleSelectedInputSourcesChangedNotification" \
           --subscribe keyboard keyboard_change
