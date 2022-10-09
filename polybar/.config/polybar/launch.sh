#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar &
sleep 1
( pgrep -x alttab > /dev/null ) || (sleep 0 && alttab -w 1 -mk Alt_L -d 1 &)
echo "Polybar launched..."
