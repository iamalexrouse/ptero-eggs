FROM debian:bullseye-slim

RUN echo steamcmd steam/question select "I AGREE" | debconf-set-selections
RUN echo steamcmd steam/license note '' | debconf-set-selections

# Install SteamCMD dependencies and SteamCMD
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

ENV PATH="/usr/games:${PATH}"

VOLUME ["/mnt/server"]

WORKDIR /mnt/server
ENTRYPOINT ["/usr/local/bin/install.sh"]
