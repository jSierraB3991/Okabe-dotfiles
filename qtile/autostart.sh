#!/bin/sh
/home/lelouch/Source/scripts/bash/change_automatic_wallpaper_one.sh &
conky &
clipcatd &
nm-applet &
blueman-applet &
picom &
deadd-notification-center &
export _JAVA_AWT_WM_NONREPARENTING=1
$HOME/Source/scripts/bash/listeng_port_listeng_diff.sh &
$HOME/Source/scripts/bash/power_pc_2am.sh &
disown -a
disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
