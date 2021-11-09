#!/usr/bin/env bash
#
# Print's the current screen index (zero based).
#
# Taken from https://superuser.com/a/1238384
# Modified from:
# https://superuser.com/a/992924/240907

OFFSET_RE="\+([-0-9]+)\+([-0-9]+)"

# Get the window position
eval "$(xdotool getmouselocation --shell)"

# Loop through each screen and compare the offset with the window
# coordinates.
monitor_index=0
while read name width height xoff yoff; do
  if [ "${X}" -ge "$xoff" \
    -a "${Y}" -ge "$yoff" \
    -a "${X}" -lt "$(($xoff + $width))" \
    -a "${Y}" -lt "$(($yoff + $height))" ]; then
    monitor=$name
    break
  fi
  ((monitor_index++))
done < <(xrandr | grep -w connected |
  sed -r "s/^([^ ]*).*\b([-0-9]+)x([-0-9]+)$OFFSET_RE.*$/\1 \2 \3 \4 \5/" |
  sort -nk4,5)

# If we found a monitor, echo it out, otherwise print an error.
if [ ! -z "$monitor" ]; then
  # echo $monitor
  echo $monitor_index
  exit 0
else
  echo "Couldn't find any monitor for the current window." >&2
  exit 1
fi
