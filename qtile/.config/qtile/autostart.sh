#!/usr/bin/env bash 

volumeicon &
nm-applet &
pgrep -x sxhkd > /dev/null || (sleep 4 && sxhkd &)
pgrep -x picom > /dev/null || picom &
pgrep -x dunst > /dev/null || dunst &
#pgrep -x tint2 > /dev/null || tint2 &
xinput set-prop "Gaming Mouse" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 0.48 >/dev/null 2>&1
killall alttab
( pgrep -x alttab > /dev/null ) || (sleep 5 && alttab -w 1 -d 1 -vp pointer -mk Alt_L &)
#( pgrep -x alttab > /dev/null ) || (sleep 5 && alttab -w 1 -mk Super_L -d 1 &)
xset r rate 300 25
sleep 2 && xwallpaper --stretch ~/.config/wp/lighthouse.jpg
xkbcomp ~/input.xkb $DISPLAY
