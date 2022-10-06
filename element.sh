#!/bin/bash

FLAGS=''

if [[ $XDG_SESSION_TYPE == "wayland" ]] && [ -c /dev/nvidia0 ]
then
    if [ -c /dev/nvidia0 ]
    then
        FLAGS="$FLAGS --disable-gpu-sandbox"
    fi
    FLAGS="$FLAGS --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer --ozone-platform=wayland"
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-im.riot.Riot}" zypak-wrapper /app/Element/element-desktop $FLAGS "$@"
