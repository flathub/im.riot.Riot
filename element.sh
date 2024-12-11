#!/bin/bash

FLAGS=''

# Checking for absolute path in WAYLAND_DISPLAY variable.
# As referenced in the description of the `wl_display_add_socket` function at https://wayland.freedesktop.org/docs/html/apc.html#id-1.11.2
if [ "${WAYLAND_DISPLAY:0:1}" = "/" ]; then
    WAYLAND_SOCKET_PATH="${WAYLAND_DISPLAY}"
else
    WAYLAND_SOCKET_PATH="$XDG_RUNTIME_DIR/${WAYLAND_DISPLAY:-wayland-0}"
fi

if [[ $XDG_SESSION_TYPE == "wayland" && -e "$WAYLAND_SOCKET_PATH" ]]
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
