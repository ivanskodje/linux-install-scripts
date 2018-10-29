# Setup ARK Survial Evolved Server on Ubuntu 18.04

## Install Ubuntu 18.04 on VirtualBox
After having setup your virtalbox image with Ubuntu 18.04 server loaded up, run it.

http://prntscr.com/l0gvia  
Select English as your preferred language, unless you wish to translate the remainder of this tutorial.

### Keyboard configuration
http://prntscr.com/l0gwg5  
Setup your keyboard according to your own needs.

### Ubuntu 18.04
http://prntscr.com/l0gwso  
Select `Install Ubuntu`.

### Network connections
http://prntscr.com/l0gx2b  
Setup your network connection. In most cases, the default should be fine.
We will adjust further network connections later in the tutorial.

### Configure proxy
http://prntscr.com/l0gx9y  
Continue.

### Configure Ubuntu archive mirror
http://prntscr.com/l0gxgz  
Continue.

### Filesystem setup
http://prntscr.com/l0gxk3  
Continue.

http://prntscr.com/l0gxr8  
Select the only disk present - this is the VirtualBox disk you created before starting the installation of Ubuntu.

http://prntscr.com/l0gy0o  
Continue.

http://prntscr.com/l0gze2  
Continue.

### Profile setup
http://prntscr.com/l0gznm
Enter your personal information. This is the account you will login with. `Import SSH identity` can be set, but will not be included in this tutorial (leave the default).

### Featured Server Snaps
http://prntscr.com/l0h0lz  
Continue. No need to install anything from this page.

### Installation complete!
http://prntscr.com/l0h1hh  
Select `Reboot Now`.
After it has rebooted, you will be ready to setup the ARK gaming server.

----


## Setup the Server environment
Following the steps from the [ark wiki](https://ark.gamepedia.com/Dedicated_Server_Setup#Linux).

### Update
Begin by updating the newly installed Ubuntu server.
`sudo apt-get update && sudo apt-get upgrade -y`

### Secure
Disable root. No exceptions.  
`sudo passwd -l root`

### Install SteamCMD

Install the required 32 bit binaries:  
`sudo apt-get install lib32gcc1 -y`  

Following the [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) installation instructions, we begin by creating a steam user.

Become root.
`sudo su`

Create the steam user.
`useradd -m steam`

Escalate to steam user
`su - steam`

Create directory for SteamCMD
`mkdir ~/Steam`

Go to directory
`cd ~/Steam`

Download and extract SteamCMD
`curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -`

### Create ARK Surival Evolved directory
Create the folder you wish to place the server files. Make sure you have plenty of disk place. The server files consume about 7.5GB of storage, as of Sept 2016. Additional content may increase this limit.  
`mkdir ~/ark`

### Running SteamCMD
Make sure you are in the Steam folder.
`cd ~/Steam`

Execute steamcmd.sh (still running as escalated steam user)
`./steamcmd.sh`

### Install ARK server
ARK Survival evolved do not need a logged in user, so we login as anonymous.
`login anonymous`

Set install directory for the installation.   
Note that you cannot use `~` to represent your home directory when entering a directory path.  
`force_install_dir <ARK DIRECTORY>`

Install ARK.  
`app_update 376030 validate`

Leave Steam when it has finished downloading.
`exit`

### Create Service
This service will run on startup, and allow you to easily monitor the status of this instance.

Create the service file. To do this, we need to run as sudo. Exit as the steam user.
`exit`

Create the service file.
`sudo nano /etc/systemd/system/ark-server.service`

Paste in the following.
```
[Unit]
Description=Starts and stop the ARK server.

[Service]
Type=simple
User=steam
Group=steam
Restart=on-failure
RestartSec=20 5
ExecStart=/home/steam/ark/ShooterGame/Binaries/Linux/ShooterGameServer  TheIsland?listen?SessionName=<server_name>?ServerPassword=<join_password>?ServerAdminPassword=<admin_password> -server -log
ExecStop=killall -TERM srcds_linux

[Install]
WantedBy=multi-user.target
```
*User* and *Group* tells the service which user and group to run as.   
*Restart=on-failure* mean we will attempt to restart the service on failure.   
*RestartSec=20 5* means we are going to try to restart at most 20 times with 5 second intervals.  
*ExecStart=...* is the command we want the service to execute on start.  

Enable service on startup.  
`sudo systemctl enable ark-server`

### Open ports
`ufw allow 27015/udp`  
`ufw allow 7777/udp`  
`ufw allow 32330/tcp`  

**27015** is the query port for Steam's server browser
**7777** is the game client port
**32330** is the RCON for remote console access


### Start the Server!
First time we do this manually. Next time you restart the VM, it will start automatically.(first time is done manually).  
`sudo service ark-server start`

---

## Tips
**You can check the logs to view progress.**
`tail -f /home/steam/ark/ShooterGame/Saved/Logs/ShooterGame.log`  
Press **CTRL+C** to exit the log view.

**If something went wrong, you can also check the service logs.**  
journalctl -c minecraft-server.service

**You can update the server properties.**  
`nano server.properties`
