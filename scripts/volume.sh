#!/usr/bin/env bash

icon_path=/usr/share/icons/Adwaita/64x64/status/
notify_id=506
sink_nr=1   # use `pacmd list-sinks` to find out sink_nr
MIXER="pulse"
SCONTROL="Master"

#------------------------------------------------------------------------

capability() { # Return "Capture" if the device is a capture device
  amixer -D $MIXER get $SCONTROL |
    sed -n "s/  Capabilities:.*cvolume.*/Capture/p"
}

volume() {
  amixer -D $MIXER get $SCONTROL $(capability)
}

format() {
  
  perl_filter='if (/.*\[(\d+%)\] (\[(-?\d+.\d+dB)\] )?\[(on|off)\]/)'
  perl_filter+='{CORE::say $4 eq "off" ? "MUTE" : "'
  # If dB was selected, print that instead
  perl_filter+=$([[ $STEP = *dB ]] && echo '$3' || echo '$1')
  perl_filter+='"; exit}'
  output=$(perl -ne "$perl_filter")
  echo "$LABEL$output"
}

#------------------------------------------------------------------------


function get_volume {
    volume | format | head -n1 | cut -d '%' -f 1
}

function get_volume_icon {

    num=$1
    if [ "$1" == "MUTE" ]; 
        then num=0
    fi

    if [ $num -lt 34 ]
    then
        echo -n "audio-volume-low-symbolic.symbolic.png"
    elif [ $num -lt 67 ]
    then
        echo -n "audio-volume-medium-symbolic.symbolic.png"
    elif [ $num -le 100 ]
    then
        echo -n "audio-volume-high-symbolic.symbolic.png"
    else
        echo -n "audio-volume-overamplified-symbolic.symbolic.png"
    fi
}

function volume_notification {
    volume=`get_volume`
    vol_icon=`get_volume_icon $volume`
    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
    dunstify -r $notify_id -u low -i $icon_path$vol_icon $bar
}

function mute_notification {
    muted=$(get_volume)

    if [ "$muted" == "MUTE" ]
    then
        dunstify -r $notify_id -u low -i ${icon_path}audio-volume-muted-symbolic.symbolic.png mute
    else
        dunstify -r $notify_id -u low -i ${icon_path}`get_volume_icon $muted` unmute
    fi
}

case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        volume_notification
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        volume_notification
	    ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        mute_notification
        ;;
    *)
        echo "Usage: $0 up | down | mute"
        ;;
esac
