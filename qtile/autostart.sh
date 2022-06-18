#!/bin/sh
feh --bg-scale $HOME/Source/Wallpapers/yesterday.jpg
conky &
clipcatd &
nm-applet &
blueman-applet &
picom & disown

# Low battery notifier
#~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
#eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
