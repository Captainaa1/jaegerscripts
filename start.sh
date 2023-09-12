#!/bin/bash

# Check if the server is already running
if screen -list | grep -q "minecraft"; then
    echo "Minecraft server is already running."
else
    # Start the Minecraft server in a screen session
    screen -S minecraft -d -m java -Xmx2G -Xms1G -jar server.jar nogui
    echo "Minecraft server is starting. To attach to the screen session, use 'screen -r minecraft'."
fi
