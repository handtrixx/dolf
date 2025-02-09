# DOLF
Dosbox-X for Wolf

## What is it?
This projects provides a dosbox-x docker image to be used by the amazing Wolf
 project.

## Why?
I want to be able to run my MS-DOS, WIN 3.1 and WIN 98 SE discs inside Wolf, e.g., to directly jump into my desktop.
Also Dosbox-X is not available in Retroarch but provides much more functionality then the original Dosbox.

## Quickstart
Dolf tries to make you start of MS-DOS, WIN 3.X or WIN 98 as easy as possible. 
But caused by legal restrictions, I am not allowed to preinstall WIN 3.X or WIN 98 for you.
If you want to use these operating systems, you either have to create image files from the 
installation discs you still have, or can maybe find them at a location like archive.org.
Sames goes for the license key for installation of WIN98.

### MS-DOS
After follwing this you will get a virtual PC with:
- A 486 DX2 CPU on 66 MHZ
- 128 MB of RAM
- A 2GB HDD as C:
- MS-DOS 5
- CD-ROM Drive + driver
- MOUSE DRIVER
- SOUNDBLASTER 16 sound card at IRQ 7, DMA 5

#### 1. Edit Wolf Config file
```toml
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
```

### Windows 98 SE
Use the dosbox-x turbo mode at "CPU" in the top menu.

#### 3. Start Image again
After the first reboot of the install leave the session by entering exit into dosbox window.
When you start the image again from moonlight the installation will continue (Don't forget to mount the Installation disc again).
After routines run through, you maybe face a blocked moonlight session. If that's the case, just quit and start the session again.

#### 4. Stop the session
Don't foget to mount the installation disc again. the hardware assistant will run again, but then you can configure windows.

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
