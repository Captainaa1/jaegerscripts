#!/bin/bash

# Check if the Minecraft server is running in a screen session
if screen -list | grep -q "minecraft"; then
    # Notify players about the impending server shutdown
    screen -S minecraft -X stuff "say Server will shut down in 30 seconds. Please save your progress.\n"
    sleep 20

    # Countdown from 10 seconds to 1 second
    for i in {10..1}; do
        screen -S minecraft -X stuff "say Server shutting down in $i seconds...\n"
        sleep 1
    done

    # Stop the Minecraft server
    screen -S minecraft -X stuff "stop\n"
    echo "Minecraft server is shutting down."
else
    echo "Minecraft server is not running."
fi
