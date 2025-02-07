# DOLF
Dosbox-X for Wolf

## What is it?

This projects provides a dosbox-x docker image to be used by the amazing Wolf
 project.

## Why?
I want to be able to run my MS-DOS, WIN 3.1 and WIN 98 SE discs inside Wolf, e.g., to directly jump into my desktop.
Also Dosbox-X is not available in Retroarch but provides much more functionality then the original Dosbox.

## Quickstart
You basically just need to add the Dolf docker image to your Wolf "config.toml" configuration file.

### Example for Classic DOS Games
...

[[apps]]
start_virtual_compositor = true
title = 'DosBox'
    [apps.runner]
    base_create_json = '''{
        "HostConfig": {
            "IpcMode": "host",
            "CapAdd": ["NET_RAW", "MKNOD"],
            "Privileged": false,
            "DeviceCgroupRules": ["c 13:* rmw", "c 244:* rmw"]
        }
    }
'''
    devices = []
    env = [ 'RUN_SWAY=true', 'GOW_REQUIRED_DEVICES=/dev/input/* /dev/dri/*',  'KEYBOARDLAYOUT=de', 'XKB_DEFAULT_LAYOUT=de' ]
    image = 'dosbox-image'
    mounts = [ '/storage/storagefs/wolf/data/dosbox:/opt/dosbox:rw' ]
    name = 'Dolf'
    ports = []
    type = 'docker'

...

## Developer
1. clone the repository

2. build the image
docker build -t dolf-image .

3. Config Wolf for DOS Games
edit your wolf config.toml

4. Config Wolf for Windows 3.11 (Games)

5. Config Wolf for Windows 98 SE (Games)

docker run --rm -it dolf-image:latest

## FAQ
