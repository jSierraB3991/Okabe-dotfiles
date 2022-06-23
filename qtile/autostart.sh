#!/bin/sh
feh --bg-scale $HOME/Source/Wallpapers/yr845Vz.png
conky &
clipcatd &
nm-applet &
blueman-applet &
picom & 
$HOME/Source/scripts/bash/listeng_port_listeng.sh &
$HOME/Source/scripts/bash/power_pc_2am.sh &
disown -a
disown
# Low battery notifier
#~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
#eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
