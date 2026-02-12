#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

ADDITIONAL_ARGS=()

if [[ -n "${FLATPAK_ID:-}" && -n "${XDG_RUNTIME_DIR:-}" ]]; then
  export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
fi

if [[ "${XDG_SESSION_TYPE:-}" == "wayland" ]]; then
  # TODO: Rework this when application upgrades to Electron 38
  ADDITIONAL_ARGS+=("--enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer")
  ADDITIONAL_ARGS+=("--enable-wayland-ime")
  ADDITIONAL_ARGS+=("--ozone-platform-hint=auto")
  ADDITIONAL_ARGS+=("--wayland-text-input-version=3")
  if [[ -c "/dev/nvidia0" ]]; then
    ADDITIONAL_ARGS+=("--disable-gpu-sandbox")
  fi
else
  ADDITIONAL_ARGS+=("--enable-features=WebRTCPipeWireCapturer")
fi

# to apply proxy from environment variable
if [[ -n "${all_proxy:-}" ]]; then
  ADDITIONAL_ARGS+=("--proxy-server=${all_proxy}")
elif [[ -n "${http_proxy:-}" ]]; then
  ADDITIONAL_ARGS+=("--proxy-server=${http_proxy}")
elif [[ -n "${https_proxy:-}" ]]; then
  ADDITIONAL_ARGS+=("--proxy-server=${https_proxy}")
fi

if [[ "${ELEMENT_DEBUG_ENABLED:-}" == "true" ]]; then
  printf "ADDITIONAL_ARGS: [%s]\n" "${ADDITIONAL_ARGS[*]:-}"
  printf "TMPDIR: %s\n" "${TMPDIR:-}"
  printf "XDG_CURRENT_DESKTOP: %s\n" "${XDG_CURRENT_DESKTOP:-}"
  printf "XDG_SESSION_TYPE: %s\n" "${XDG_SESSION_TYPE:-}"
fi

exec zypak-wrapper "/app/Element/element-desktop" "${ADDITIONAL_ARGS[@]}" "$@"
