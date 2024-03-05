#!/bin/bash

FLAGS=''

# Workaround for currently broken search, disabling it, without the need to manage to navigate to seshat settings.
if [[ $DISABLE_ENCRYPTED_SEARCH == "true" ]]; then
    find ${XDG_CONFIG_HOME} -type d -a -name EventStore -exec rm -r {} \&\& touch {} \;
fi

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

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-im.riot.Riot}" zypak-wrapper /app/Element/element-desktop $FLAGS "$@"
