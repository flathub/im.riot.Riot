#!/bin/bash

FLAGS="--enable-features=WebRTCPipeWireCapturer"

if  [ -c /dev/nvidia0 ]
then
    FLAGS="$FLAGS --disable-gpu-sandbox"
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-im.riot.Riot}" zypak-wrapper /app/Element/element-desktop $FLAGS "$@"