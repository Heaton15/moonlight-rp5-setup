# moonlight-rp5-setup
moonlight-qt setup for RP5

# Usage
make help

make install

make reinstall

make clean 

# Background 
This repo provides a setup process to turn a RP5 into a standalone moonlight service. This is achieved by:

    1. Installing the moonlight-qt binary from source 

    2. Generating a moonlight.service file which systemd can use to automatically boot moonlight on power on.
       This is a nice feature to have when you want to start games on power up (not keyboard or interface to the RP5 needed aside from a game controller). 

# Notable Observations 

    1. The RP5 bluetooth works, but its too unreliable to use for gaming. Use a vendor bluetooth dongle if available, and there seems to be no observable lag or disconnects.  

    2. Configure the RP5 to boot into a TTY. Do not launch moonlight with the full Desktop Environment (GUI), since this adds a lot of overhead.  


# Setup
After installing moonlight-qt, the binary will be in your path, and the systemd service will be enabled. Next, run `raspi-config` and configure the RP5 to boot into the CLI
by changing the boot option from "Desktop / CLI' and select `B2`. This will allow you to boot into your RP5 user CLI and not launch the desktop environment.

If you wish to undo this, run `startx` in the CLI to launch the gui, and then go through the same steps and change B2 back to B4. 
