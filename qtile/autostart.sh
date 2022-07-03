#!/bin/sh
feh --bg-scale $HOME/Images/background/cy0t53hrgi791.jpg
conky &
clipcatd &
nm-applet &
blueman-applet &
picom &
deadd-notification-center &
export _JAVA_AWT_WM_NONREPARENTING=1
$HOME/Source/scripts/bash/listeng_port_listeng.sh &
$HOME/Source/scripts/bash/power_pc_2am.sh &
disown -a
disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
