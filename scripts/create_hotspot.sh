#!/usr/bin/bash

SSID=$1
PASSWD=$2
WIFI_IF=$(ifconfig -a -s | grep '^w' | awk '{print $1}')

echo "Creating a hotspot $SSID for the wifi interface $WIFI_IF with password $PASSWD"

nmcli dev wifi hotspot ifname ${WIFI_IF} ssid $SSID password $PASSWD
