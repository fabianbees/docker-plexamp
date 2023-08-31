# Docker Container for Plexamp


Docker container for Plexamp headless, see also: https://www.plex.tv/plexamp/#downloads and 


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
    -e PLEXAMP_PLAYER_NAME='plexamp-docker'
    -p 32500:32500 \
    -p 20000:20000 \
    --device "/dev/snd:/dev/snd" \
    fabianbees/plexamp:latest
```


## Deploy via docker-compose

Deploy container via docker-compose v3 schema:

```bash
git clone https://github.com/fabianbees/docker-plexamp.git

cd docker-plexamp

docker compose up
```


```yaml
version: "3.8"
services:
  plexamp:
    image: fabianbees/plexamp:latest
    container_name: docker-plexamp
    environment:
      - PLEXAMP_CLAIM_TOKEN: "your plex clain here"  # see: https://www.plex.tv/claim
      - PLEXAMP_PLAYER_NAME: "plexamp-docker"
    ports:
      - 32500:32500
      - 20000:20000
    devices:
      - "/dev/snd:/dev/snd"
    restart: unless-stopped
```

