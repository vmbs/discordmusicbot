```markdown
# DiscordMusicBot

DiscordMusicBot is a Docker container that runs JMusicBot, a popular music bot for Discord. This container includes all necessary dependencies and configurations to run JMusicBot seamlessly.

## Features

- Plays music from YouTube and other sources in your Discord server.
- Supports playlists, search, and more.
- Easy to deploy and manage with Docker.

## Prerequisites

- Docker installed on your machine.
- A valid Discord bot token.
- Your Discord user ID as the bot owner ID.

## How to Use This Image

### Running the Bot

#### Using Docker CLI

```sh
docker run -d \
  --name discordmusicbot \
  -e DISCORD_TOKEN=your-discord-token-here \
  -e OWNER_ID=your-owner-id-here \
  -p 2333:2333 \
  minica/discordmusicbot:latest
```

#### Using Docker Compose

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  discordmusicbot:
    image: minica/discordmusicbot:latest
    ports:
      - "2333:2333"
    environment:
      DISCORD_TOKEN: your-discord-token-here
      OWNER_ID: your-owner-id-here
    volumes:
      - ./config:/config
    restart: unless-stopped
```

Run Docker Compose:

```sh
docker-compose up -d
```

### Configuration

- **DISCORD_TOKEN:** Your Discord bot token.
- **OWNER_ID:** Your Discord user ID as the bot owner.

The configuration files and logs are stored in the `/config` directory inside the container. You can map this directory to a local path using Docker volumes to persist your configuration across container restarts.

## Updating to a New Version

To update the bot to a new version, pull the latest image from Docker Hub and restart your container:

```sh
docker pull minica/discordmusicbot:latest
docker-compose down
docker-compose up -d
```

## Support and Documentation

For detailed documentation, please visit the [JMusicBot GitHub repository](https://github.com/jagrosh/MusicBot).

## Contributing

If you find a bug or have a feature request, please open an issue on the [GitHub repository](https://github.com/your-github-username/discordmusicbot).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
