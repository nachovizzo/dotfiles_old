#!/bin/bash

set -ex

# Download Font
# wget https://developer.apple.com/design/downloads/SF-Mono.dmg  && 7z x SF-Mono.dmg && cd SFMonoFonts/ && 7z x SF\ Mono\ Fonts.pkg && 7z x Payload~

# Get the one I like the most
mkdir -p sfmono
cp SFMonoFonts/Library/Fonts/SF-Mono-Medium.otf sfmono/

# Patch with docker container
docker run -v $(realpath .)/sfmono/:/in -v $(realpath .)/patched:/out nerdfonts/patcher -c -s

rm -rf SF*

cp SFMono\ Medium\ Nerd\ Font\ Complete\ Mono.otf ~/.local/share/fonts
fc-cache -f -v

# dconf write, or dconf editor, manually select SF Mono
# dconf write /org/gnome/terminal/legacy/profiles:/<profile-id>/font "'SF Mono 11'"


