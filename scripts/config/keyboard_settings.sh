#!/bin/sh

# Use CapsLock as Super key
setxkbmap -option 'caps:super'

# Use CapsLock as Escape key if nothing else is pressed aftwerwards
xcape -e 'Super_L=Escape' -t 300

