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
        git
EOF

ARG JULIUS_VERSION=4ba475bd430faa5919e13e2020d6edda1491fb66
RUN <<EOF
    git clone https://github.com/julius-speech/julius.git /opt/julius
    cd /opt/julius
    git checkout "${JULIUS_VERSION}"
EOF

RUN <<EOF
    cd /opt/julius
    ./configure --enable-words-int
    make -j$(nproc)
EOF

RUN <<EOF
    cd /opt/julius
    make install
EOF
