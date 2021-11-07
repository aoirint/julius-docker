# syntax=docker/dockerfile:1.3-labs
FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
RUN <<EOF
    apt-get update
    apt-get install -y \
        build-essential \
        zlib1g-dev \
        libsdl2-dev \
        libasound2-dev \
        git \
        git-lfs \
        wget \
        unzip
EOF

ARG JULIUS_VERSION=1ceb4dec245ef482918ca33c55c71d383dce145e
RUN <<EOF
    git clone https://github.com/julius-speech/dictation-kit.git /opt/julius
    cd /opt/julius
    git checkout "${JULIUS_VERSION}"
EOF

WORKDIR /opt/julius
