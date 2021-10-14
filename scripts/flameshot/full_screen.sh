#!/usr/bin/env bash
# Originally https://github.com/flameshot-org/flameshot/issues/273#issuecomment-613660060
# Taken from https://github.com/flameshot-org/flameshot/issues/523#issuecomment-942058104
flameshot gui

while true; do
    if [ "$(xdotool search --onlyvisible --class flameshot)" = "" ]; then
        sleep 0.1
    else
        break
    fi
done

xdotool key ctrl+a
