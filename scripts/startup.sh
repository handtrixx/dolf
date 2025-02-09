#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

KEYBOARDLAYOUT=${KEYBOARDLAYOUT}
OS=${OS}

gow_log "Starting DOSBox-X"

# Copying the config file to the right place
mkdir -p /opt/dosbox/os/dos/c
mkdir -p /opt/dosbox/os/win31/c
mkdir -p /opt/dosbox/os/win98/d
mkdir -p /opt/dosbox/configs
cp -u /cfg/dos.conf /opt/dosbox/configs/dos.conf
cp -u /cfg/win31.conf /opt/dosbox/configs/win31.conf
cp -u /cfg/win98.conf /opt/dosbox/configs/win98.conf
cp -u /cfg/win98_install.conf /opt/dosbox/configs/win98_install.conf

# Setting the OS from variable os
if [ "$OS" == "WIN31" ]; then
    CONF="/opt/dosbox/configs/win31.conf"
elif [ "$OS" == "WIN98" ]; then
    # check if file /opt/dosbox/os/win98/c.img exists
    if [ ! -f /opt/dosbox/os/win98/c.img ]; then
        gow_log "Disk image for Windows 98 not found, creating it and starting config for fresh install"
        CONF="/opt/dosbox/configs/win98_install.conf"
    else
        CONF="/opt/dosbox/configs/win98.conf"
    fi
else
    CONF="/opt/dosbox/configs/dos.conf"
fi

source /opt/gow/launch-comp.sh
launcher /usr/bin/dosbox-x -conf $CONF -set "keyboardlayout=$KEYBOARDLAYOUT"