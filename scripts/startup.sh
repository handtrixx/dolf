#!/bin/bash
set -e

KEYBOARDLAYOUT=${KEYBOARDLAYOUT}

source /opt/gow/launch-comp.sh
launcher /usr/bin/dosbox-x -set "keyboardlayout=$KEYBOARDLAYOUT" -defaultdir /opt/dosbox -conf /opt/dosbox/dosbox-x.conf -c "mount c /opt/dosbox/c"