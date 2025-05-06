#!/bin/bash

sketchybar --set "$NAME" label="$(ps -A -o %cpu | awk '{s+=$1} END {s /= 8} END {printf "%.0f%%\n", s}')"

