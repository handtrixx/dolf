#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

KEYBOARDLAYOUT=${KEYBOARDLAYOUT}
OS=${OS}

gow_log "Starting DOSBox-X"

# Copying the config file to the right place
mkdir -p /opt/dosbox/os/dos/c
mkdir -p /opt/dosbox/os/win31/c
mkdir -p /opt/dosbox/os/win98/c
mkdir -p /opt/dosbox/configs
cp -u /cfg/dos.conf /opt/dosbox/configs/dos.conf
cp -u /cfg/win31.conf /opt/dosbox/configs/win31.conf
cp -u /cfg/win98.conf /opt/dosbox/configs/win98.conf

# Setting the OS from variable os
if [ "$OS" == "WIN31" ]; then
    CONF="/opt/dosbox/configs/win31.conf"
elif [ "$OS" == "WIN98" ]; then
    CONF="/opt/dosbox/configs/win98.conf"
else
    CONF="/opt/dosbox/configs/dos.conf"
fi

source /opt/gow/launch-comp.sh
#launcher /usr/bin/dosbox-x -set "keyboardlayout=$KEYBOARDLAYOUT"
launcher /usr/bin/dosbox-x -conf $CONF -set "keyboardlayout=$KEYBOARDLAYOUT"