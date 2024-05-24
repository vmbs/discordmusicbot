#!/bin/bash

# Check if DISCORD_TOKEN and OWNER_ID are set
if [ -z "$DISCORD_TOKEN" ]; then
  echo "Error: DISCORD_TOKEN is not set."
  exit 1
fi

if [ -z "$OWNER_ID" ]; then
  echo "Error: OWNER_ID is not set."
  exit 1
fi

# Create the configuration file
cat <<EOT > config.txt
token = $DISCORD_TOKEN
owner = $OWNER_ID
EOT

# Run the JMusicBot
java -jar JMusicBot.jar
