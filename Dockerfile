FROM node:16-bookworm

RUN apt update && apt upgrade -y && \
    apt install -y libasound2 && \
    rm -rf /var/cache/apt /var/lib/apt/lists

ENV APP_VERSION="4.8.3"
ENV PLEXAMP_PLAYER_NAME="plexamp-docker"

RUN wget "https://plexamp.plex.tv/headless/Plexamp-Linux-headless-v$APP_VERSION.tar.bz2" -O plexamp-linux-headless.tar.bz2 \
    && tar -xvf plexamp-linux-headless.tar.bz2 \
    && rm plexamp-linux-headless.tar.bz2


ENTRYPOINT node /plexamp/js/index.js

