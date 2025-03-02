#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

KEYBOARDLAYOUT=${KEYBOARDLAYOUT}
#if no keyboard layout is set, default to us
if [ -z "$KEYBOARDLAYOUT" ]; then
    KEYBOARDLAYOUT="us"
fi
gow_log "Keyboard layout set to $KEYBOARDLAYOUT"

#check if directories /home/retro/c exists, if not create them
if [ ! -d "/home/retro/c" ]; then    
    mkdir /home/retro/c
    gow_log "Created /home/retro/c directory"
else
    gow_log "/home/retro/c directory already exists, will not touch it."
fi

# check if configuration file exists, if not copy the default one
if [ ! -f "/home/retro/dos.conf" ]; then
    cp -u /tmp/dos.conf /home/retro/dos.conf
    gow_log "Copied default configuration file to /home/retro/dos.conf"
else
    gow_log "/home/retro/dos.conf already exists, will not touch it."
fi

gow_log "Starting Dolf"

source /opt/gow/launch-comp.sh
launcher /usr/bin/dosbox-x -conf /home/retro/dos.conf -set "keyboardlayout=$KEYBOARDLAYOUT"
