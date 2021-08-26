#!/usr/bin/env bash
#
# These things are run when an Openbox X Session is started.
# You may place a similar script in $HOME/.config/openbox/autostart
# to run user-specific things.
#

# If you want to use GNOME config tools...
#
#if test -x /usr/lib/openbox/gnome-settings-daemon >/dev/null; then
#  /usr/lib/openbox/gnome-settings-daemon &
#elif which gnome-settings-daemon >/dev/null 2>&1; then
#  gnome-settings-daemon &
#fi

# If you want to use XFCE config tools...
#
#xfce-mcs-manager &
pgrep -x sxhkd > /dev/null || (sleep 4 && sxhkd &)
#pgrep -x picom > /dev/null || picom &
pgrep -x dunst > /dev/null || dunst &
#pgrep -x tint2 > /dev/null || tint2 &
#xinput set-prop "Gaming Mouse" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 0.48 >/dev/null 2>&1
killall alttab
( pgrep -x alttab > /dev/null ) || (sleep 5 && alttab -w 1 -d 1 -mk Alt_L &)
#( pgrep -x alttab > /dev/null ) || (sleep 5 && alttab -w 1 -mk Super_L -d 1 &)
xset r rate 300 25
sleep 1 && xwallpaper --stretch ~/.config/wp/lighthouse.jpg
xkbcomp ~/input.xkb $DISPLAY
volumeicon &
nm-applet &

#sleep 2 && $HOME/.config/polybar/launch.sh
