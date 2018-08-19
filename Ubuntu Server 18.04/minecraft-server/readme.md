# Setup a MineCraft Server on a clean Ubuntu Server 18.04
Install Ubuntu Server 18.04.
Make sure to select **Install Ubuntu** during the install process, and not any of the other options.

After you have gained access and logged in, continue.

You can start by making sure the server is up to date.  
`sudo apt-get update && sudo apt-get upgrade -y`

## Secure the server
Disable root. No exceptions.  
`sudo passwd -l root`

## Install Java
**Check if you have Java installed.**  
`java -version`  
If you get a message saying it is not available, continue with the Java installation.

**Install OpenJDK.**  
`sudo apt-get install default-jdk -y`  
You can confirm the install was success by checking the version again.

## Create the MineCraft system user

**Add user and set the home directory.**  
`sudo adduser --system --home /srv/minecraft-server minecraft`

**Create the minecraft group.**  
`sudo addgroup --system minecraft`

**Add the minecraft user to the *minecraft* group.**  
`sudo adduser minecraft minecraft`


## Setup the MineCraft server
**Download the server file.**  
`sudo wget -O /srv/minecraft-server/server.jar https://launcher.mojang.com/mc/game/1.13/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar`

**Create accepted EULA file.**  
echo "eula=true" | sudo tee -a /srv/minecraft-server/eula.txt

### Create the service
The MineCraft server service will be used to start/stop the server, as well as to make sure it automatically starts on restart.

**Create the startup script.**  
`sudo nano /srv/minecraft-server/start.sh`  
This is where we will put the script that will be run whenever we *start the service*.

**Paste in the following.**  
```
#!/bin/bash
/usr/bin/java -Xms1536M -Xmx1536M -jar server.jar nogui
```  
The reason we add this in a script instead of directly in the service ExecStart, is because we need to run this as sudo.

**Set the appropriate permissions.**  
`sudo chown -R minecraft.minecraft /srv/minecraft-server`
`sudo chmod +x /srv/minecraft-server/start.sh`

**Create the service file.**  
`sudo nano /etc/systemd/system/minecraft-server.service`

**Paste in the following.**
```
[Unit]
Description=Starts and stop the minecraft server.

[Service]
WorkingDirectory=/srv/minecraft-server
User=minecraft
Group=minecraft
Restart=on-failure
RestartSec=20 5
ExecStart=/srv/minecraft-server/start.sh

[Install]
WantedBy=multi-user.target
```
*User* and *Group* tells the service which user and group to run as.   
*Restart=on-failure* mean we will attempt to restart the service on failure.   
*RestartSec=20 5* means we are going to try to restart at most 20 times with 5 second intervals.  
*ExecStart=...* is the command we want the service to execute on start.  

## Enable service on startup
`sudo systemctl enable minecraft-server`

## Start the server
`sudo service minecraft-server start`

---
## Tips
**You can check the logs to view progress.**
`tail -f /srv/minecraft-server/logs/latest.log`  
Press **CTRL+C** to exit the log view.

**If something went wrong, you can also check the service logs.**  
journalctl -c minecraft-server.service

**You can update the server properties.**  
`nano server.properties`
