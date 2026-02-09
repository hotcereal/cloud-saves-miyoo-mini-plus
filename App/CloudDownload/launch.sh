#!/bin/sh
echo $0 $*
LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Downloading saves" -m "Your saves are being downloaded to your device!" --auto

cd $(dirname "$0")

/mnt/SDCARD/rclone copy -P -L --no-check-certificate cloud:Onion/saves/retroarch/ /mnt/SDCARD/Saves/CurrentProfile/
