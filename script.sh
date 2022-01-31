#!/bin/sh
### BEGIN INIT INFO
# Provides:          filenotifier
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Something
# Description:       Something else
### END INIT INFO
cd /home/horacio/Dropbox/RemoteTurnOff
inotifywait -e close_write,moved_to,create -m . |
while read -r directory events filename; do
  if [ "$filename" = "fileToWatch.txt" ]; then
    systemctl poweroff
  fi
done
