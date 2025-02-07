# syntax=docker/dockerfile:1.4

# hadolint ignore=DL3006
FROM ghcr.io/games-on-whales/base-app:edge

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    libgtk-3-dev \
    libasound2-dev \
    libpulse-dev \
    libx11-dev \
    libxext-dev \
    libxrandr-dev \
    automake \
    gcc \
    g++ \
    make \
    nasm \
    libsdl-net1.2-dev \ 
    libsdl2-net-dev \ 
    libpcap-dev \
    libslirp-dev \
    fluidsynth \
    libfluidsynth-dev \
    libavformat-dev \
    libavcodec-dev \
    libavcodec-extra \
    libswscale-dev \
    libfreetype-dev \
    libxkbfile-dev \
    libxrandr-dev \
    kdialog

# Clone the DOSBox-X repository
RUN git clone https://github.com/joncampbell123/dosbox-x.git /dosbox-x
RUN ls -la /dosbox-x
# Build DOSBox-X
WORKDIR /dosbox-x
RUN ./build-debug-sdl2 && \
    make install

# Cleanup
RUN apt-get autoremove -y && \
    apt-get remove -y cmake git automake gcc g++ make nasm build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /dosbox-x

COPY --chmod=777 scripts/startup.sh /opt/gow/startup-app.sh

RUN mkdir -p /cfg
RUN mkdir -p /opt/dosbox/os/dos/c
RUN mkdir -p /opt/dosbox/os/win31/c
RUN mkdir -p /opt/dosbox/os/win98/c
RUN mkdir -p /opt/dosbox/configs
WORKDIR /opt/dosbox
COPY configs/ /cfg/

ENV XDG_RUNTIME_DIR=/tmp/.X11-unix

ARG IMAGE_SOURCE
LABEL org.opencontainers.image.source=$IMAGE_SOURCE