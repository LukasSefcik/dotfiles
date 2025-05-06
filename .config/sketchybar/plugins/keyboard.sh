#!/bin/bash

# Získanie informácie o klávesnici
KEYBOARD_INFO="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources)"
KEYBOARD_INPUT=$(echo "$KEYBOARD_INFO" | grep "KeyboardLayout Name" | sed 's/.*= \(.*\);/\1/' | tr -d ' "')

# Nastavenie ikony podľa typu klávesnice
if [ "$KEYBOARD_INPUT" = "Slovak" ]; then
    ICON="SK"
elif [ "$KEYBOARD_INPUT" = "U.S." ]; then
    ICON="US"
else
    ICON="$KEYBOARD_INPUT"
fi

# Aktualizácia SketchyBaru
sketchybar --set keyboard label="$ICON"
