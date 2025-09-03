FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       software-properties-common \
       ca-certificates \
       curl \
    && apt-add-repository non-free \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       steamcmd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/games
ENTRYPOINT ["steamcmd"]