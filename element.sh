#!/bin/bash

FLAGS=''

if [[ $XDG_SESSION_TYPE == "wayland" && -e "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" ]]
then
    FLAGS="$FLAGS --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer"
    if  [ -c /dev/nvidia0 ]
    then
        FLAGS="$FLAGS --disable-gpu-sandbox"
    fi
else
    FLAGS="$FLAGS --enable-features=WebRTCPipeWireCapturer"
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-im.riot.Riot}" zypak-wrapper /app/Element/element-desktop $FLAGS "$@"
