#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

KEYBOARDLAYOUT=${KEYBOARDLAYOUT}
#if no keyboard layout is set, default to us
if [ -z "$KEYBOARDLAYOUT" ]; then
    KEYBOARDLAYOUT="us"
fi

gow_log "Starting Dolf"

# Copying the config file to the right place
mkdir -p /opt/dosbox/os/dos/c
mkdir -p /opt/dosbox/configs
cp -u /cfg/dos.conf /opt/dosbox/configs/dos.conf

# Setting the OS from variable os
CONF="/opt/dosbox/configs/dos.conf"

source /opt/gow/launch-comp.sh
launcher /usr/bin/dosbox-x -conf $CONF -set "keyboardlayout=$KEYBOARDLAYOUT"