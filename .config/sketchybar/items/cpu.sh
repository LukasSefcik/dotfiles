#!/bin/bash

sketchybar --add item cpu right \
           --set cpu script="$PLUGIN_DIR/cpu.sh" \
                     label.width=35 \
                     update_freq=2 \
           --set cpu icon="$CPU" \
           --subscribe cpu system_woke
