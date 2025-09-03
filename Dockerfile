FROM debian:bookworm-slim

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       curl \
       lib32gcc-s1 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/local/steamcmd \
    && curl -sSL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
       | tar -xz -C /usr/local/steamcmd

WORKDIR /usr/local/steamcmd
ENTRYPOINT ["./steamcmd.sh"]