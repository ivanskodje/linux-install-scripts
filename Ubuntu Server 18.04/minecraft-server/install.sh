#!/bin/bash
# Auto server setup script
# For Ubuntu Server 18.04 New Install (no extras).

# All this does is set everything up. You will need to run `sudo service minecraft-server start` in order to start it, unless you reboot the machine.

# Update server
sudo apt-get update && sudo apt-get upgrade -y

# Secure server
sudo passwd -l root

# Install OpenJDK
sudo apt-get install default-jdk -y

# Create minecraft user
sudo adduser --system --home /srv/minecraft-server minecraft
sudo addgroup --system minecraft
sudo adduser minecraft minecraft

# Download server.jar
sudo wget -O /srv/minecraft-server/server.jar https://launcher.mojang.com/mc/game/1.13/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar

# Create accepted eula file
echo "eula=true" | sudo tee -a /srv/minecraft-server/eula.txt

# Create startup script
echo -e "#!/bin/bash \n/usr/bin/java -Xms1536M -Xmx1536M -jar server.jar nogui" | sudo tee -a /srv/minecraft-server/start.sh

# Setup permissions
sudo chown -R minecraft.minecraft /srv/minecraft-server
sudo chmod +x /srv/minecraft-server/start.sh

# Create service file
sudo cat > /etc/systemd/system/minecraft-server.service << EOF
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
EOF

# Enable service on startup
sudo systemctl enable minecraft-server

echo "------------------------------------"
echo "MineCraft Server setup is complete! "
echo ""
echo "You will need to run 'sudo service minecraft-server start' in order to start it, unless you reboot the machine."
echo "------------------------------------"
