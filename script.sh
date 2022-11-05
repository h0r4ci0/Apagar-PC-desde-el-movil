#!/bin/sh

# INFO
# Provides:          filenotifier
# Package (AUR):     inotify-tools

directory="/home/`whoami`/Dropbox/RemoteTurnOff"
filename="fileToWatch.txt"

cd $directory
inotifywait -e close_write,moved_to,create -m . |
while read -r directory events filename; do
  if [ $file=$filename ]; then
    systemctl poweroff
  fi
done
