# moonlight-rp5-setup
moonlight-qt setup for RP5



# Background 
This repo provides a setup process to turn a RP5 into a standalone moonlight service. This is achieved by:
    1. Installing the moonlight-qt binary from source 
    2. Generating a moonlight.service file which systemd can use to automatically boot moonlight on power on.
       This is a nice feature to have when you want to start games on power up (not keyboard or interface to the RP5 needed aside from a game controller). 

# Notable Observations 
    1. The RP5 bluetooth works, but its too unreliable to use for gaming. Use a vendor bluetooth dongle if available, and there seems to be no observable lag or disconnects.  
