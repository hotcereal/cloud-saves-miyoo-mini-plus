#!/bin/sh
echo $0 $*
LD_PRELOAD=/mnt/SDCARD/miyoo/lib/libpadsp.so /mnt/SDCARD/.tmp_update/bin/infoPanel -t "Uploading saves" -m "Your saves are being uploaded to the cloud!" --auto

cd $(dirname "$0")

/mnt/SDCARD/rclone copy -P -L --no-check-certificate /mnt/SDCARD/Saves/CurrentProfile/ cloud:Onion/saves/retroarch/ 
