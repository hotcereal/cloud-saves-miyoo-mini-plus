# Cloud Saves for the Miyoo Mini+

![Main Apps UI](https://github.com/hotcereal/files/blob/main/Unknown-3.png?raw=true)

Utilizing rclone, upload and download saves to and from your Miyoo Mini Plus and any cloud storage service like Google Drive, MEGA, Dropbox, OneDrive, etc.

## Pre-requisities
- [OnionOS 4.2 beta](https://github.com/OnionUI/Onion/releases/tag/dev-v4.2.0-beta) (at least) must be installed for this to function.
- SSH app on Miyoo Mini+
- Wifi enabled
- The Linux ARM64 version of rclone, available [here](https://downloads.rclone.org/v1.66.0/rclone-v1.66.0-linux-arm64.zip)

## Installation

0. If you already have an `rclone.conf` file from another installation, you can throw it in the root of your SD card and skip steps 3 and 4. Be sure to open the file in a text editor and rename whichever remote you want to use from `[remote name]` to `[cloud]`.

1. Drag the `App` folder from this repo to the root of your SD card.
2. Drag the `rclone` file with no extension from the rclone for [Linux ARM64 download](https://downloads.rclone.org/v1.62.2/rclone-v1.62.2-osx-arm64.zip) also to the root of your SD card.
3. SSH into your Miyoo Mini+. (Alternatively, you could use the Terminal app on the MM+ itself, but that's the sadist difficulty setting.)
4. Run `/mnt/SDCARD/rclone config` and name your remote `cloud`. Follow the steps. When it asks if your installation is headless, say yes. 

### Post-install

There is a supplementary app that fixes the system time, [Time Quick Fix](https://github.com/hotcereal/time-quick-fix). Utilizing NTP and CloudFlare, it checks the current time and sets it as such on your console. You should run *when your first start your console* as the system willl only progress in time so long as it's on. 

The added benefit is that if it is started when your first boot your consoles, your saves, when uploaded, when have the correct time in their metadata. Meaning, if you share that cloud save location across multiple different OSes and devices, you should be able to upload a new save from your MM+ once you are finished playing, and barring when your sync settings are in other apps, pick up and play, resuming from the exact same location on another device. If this is our goal, the afformentioned Time Quick Fix is necessary. 

#### Notes:
These features are likely to come to OnionOS in the coming weeks/months. If and when that happens, consider this repo obsolete. If need be, I will update with minor fixes if anything needs changing. 

If you notice the information screens display for a flash or a second or so, something did not work. You can troubleshoot this yourself by SSHing into the MM+ and running `./mnt/SDCARD/App/Cloud[Upload or Download]/launch.sh`. This will run the command via SSH and in the Terminal being used, you can read and see any reports of issues.

Messing with the time a lot on your device can sometimes create authentication problems with rclone. However, in my minimal testing, I've found that while using the default CLIENT_ID and CLIENT_SECRET in rclone does result in slower upload and download times, it migigates the proble of having to repeatedly fix the rclone configuration file. 

All of these apps are powered by simple Linux commands. Feel free to edit them how you see fit. 
