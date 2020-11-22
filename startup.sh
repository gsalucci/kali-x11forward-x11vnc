#!/bin/bash
export USER=root
FILE=/root/.vnc/passwd
VARSFILE=/root/.vnc/vncvars
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist."
    vncpasswd
    echo "set vnc resolution: eg. 1920x1080"
    read VNC_GEOMETRY
    if [ -z "$VNC_GEOMETRY" ]; then
        echo "\$VNC_GEOMETRY is empty setting default"
        VNC_GEOMETRY="1920x1080"
    fi
    echo "set vnc depth eg. 24"
    read VNC_DEPTH
    if [ -z "$VNC_DEPTH" ]; then
        echo "\$VNC_DEPTH is empty setting default"
        VNC_DEPTH="24"
    fi
    echo "export VNC_GEOMETRY=$VNC_GEOMETRY" > $VARSFILE
    echo "export VNC_DEPTH=$VNC_DEPTH" >> $VARSFILE

fi
source $VARSFILE
rm /tmp/.X1-lock > /dev/null
rm /tmp/.X11-unix/X1 > /dev/null
vncserver :1 -geometry $VNC_GEOMETRY -depth $VNC_DEPTH
bash
vncserver -kill :1
rm /tmp/.X1-lock > /dev/null
rm /tmp/.X11-unix/X1 > /dev/null
exit