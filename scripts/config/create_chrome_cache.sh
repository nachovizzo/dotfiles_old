#!/bin/bash
# This script is used to duplicate the chrome settings on startup, I hate this
# If not chrome will always use the same session
mkdir -p /tmp/chrome
rsync -av --delete --exclude=*LOG --exclude=*.log --exclude=*.old --exclude=/Singleton* --exclude=/Session* ~/.config/google-chrome/ /tmp/chrome/
