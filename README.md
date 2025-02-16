# Docker Container for Plexamp

<p align="center">
  <a href="https://www.plex.tv/plexamp">
    <img src="https://www.plex.tv/wp-content/uploads/2022/09/plexamp-app-icon.png" alt="https://www.plex.tv/plexamp" width="150px" />
  </a>
</p>

Docker container for Plexamp headless, see also: https://www.plex.tv/plexamp/#downloads and https://forums.plex.tv/t/plexamp-on-the-raspberry-pi/791500


## Tags

| Registry | Image | Tag | Build |
|:------------------:|:------------------:|:--------------:|:-----------------:|
| [Docker-Hub](https://hub.docker.com/r/fabianbees/plexamp/tags) | fabianbees/plexamp | latest | ![pipeline status](https://gitlab.fabianbees.de/fabianbees/docker-plexamp/badges/master/pipeline.svg) |





## Deploy via docker run

The container can be run via plain docker:

```bash
docker run -d \
    --name plexamp \
    -e PLEXAMP_CLAIM_TOKEN='your plex clain here' `# see: https://www.plex.tv/claim` \
    -e PLEXAMP_PLAYER_NAME='plexamp-docker' \
    -p 32500:32500 \
    -p 20000:20000 \
    --device "/dev/snd:/dev/snd" \
    fabianbees/plexamp:latest
```

> **_NOTE:_**  The Plexamp WebUI can be reached on Container Port 32500 (navigate to http://localhost:32500).


## Deploy via docker-compose

Deploy container via docker-compose v3 schema:

```bash
git clone https://github.com/fabianbees/docker-plexamp.git

cd docker-plexamp

docker compose up
```


```yaml
services:
  plexamp:
    image: fabianbees/plexamp:latest
    container_name: plexamp-headless
    environment:
      PLEXAMP_CLAIM_TOKEN: "your plex clain here"  # see: https://www.plex.tv/claim
      PLEXAMP_PLAYER_NAME: "plexamp-docker"
    ports:
      - 32500:32500
      - 20000:20000
    devices:
      - "/dev/snd:/dev/snd"
    restart: unless-stopped
```

