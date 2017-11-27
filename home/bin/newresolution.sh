 #!/bin/bash

export XAUTHORITY=$(echo $HOME)/.Xauthority
MONITOR=$1
WIDTH=$2
HEIGHT=$3
REFRESH_RATE=$4
#echo $DISPLAY
MODELINE=$(cvt $WIDTH $HEIGHT $REFRESH_RATE | sed -e'1d'| sed -e 's/^ *[^ ]* //')
MODE_DATA=$( echo $MODELINE | awk '{print $1}' | sed -e 's/"//g' )
MODE=$( echo $MODE_DATA | sed -e 's/\(^[^_]*\).*/\1/' )
echo $MODELINE
echo $MODE_DATA
echo $MODE 
xrandr --newmode $MODELINE
xrandr --addmode $MONITOR $MODE_DATA
#xrandr --output $MONITOR --mode $MODE