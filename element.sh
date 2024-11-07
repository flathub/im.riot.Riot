#!/bin/bash

FLAGS=''

if [[ $XDG_SESSION_TYPE == "wayland" && -e "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" ]]
then
    FLAGS="$FLAGS --enable-wayland-ime --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer"
    if  [ -c /dev/nvidia0 ]
    then
        FLAGS="$FLAGS --disable-gpu-sandbox"
    fi
else
    FLAGS="$FLAGS --enable-features=WebRTCPipeWireCapturer"
fi

# to apply proxy from environment variable
if [[ $all_proxy ]]; then
    FLAGS="$FLAGS --proxy-server=$all_proxy"
elif [[ $http_proxy ]]; then
    FLAGS="$FLAGS --proxy-server=$http_proxy"
elif [[ $https_proxy ]]; then
    FLAGS="$FLAGS --proxy-server=$https_proxy"
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-im.riot.Riot}" zypak-wrapper /app/Element/element-desktop $FLAGS "$@"
