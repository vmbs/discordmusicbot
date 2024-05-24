# Use the Bitnami Minideb image as a base
FROM bitnami/minideb:bullseye

# Install necessary packages
RUN install_packages openjdk-11-jre-headless wget curl grep

# Create a directory for DiscordMusicBot
RUN mkdir -p /opt/discordmusicbot

# Set the working directory
WORKDIR /opt/discordmusicbot

# Download JMusicBot Check for the latest
RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.4.1/JMusicBot-0.4.1.jar -O JMusicBot.jar

# Add the run script
COPY run.sh /opt/discordmusicbot/

# Make the run script executable
RUN chmod +x /opt/discordmusicbot/run.sh

# Expose the default port
EXPOSE 2333

# Set the entrypoint
ENTRYPOINT ["./run.sh"]
