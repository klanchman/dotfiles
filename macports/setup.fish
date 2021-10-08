#!/usr/bin/env fish

read -P "[H]ome or [W]ork? " WHERE_AM_I

set PORTS \
  carthage \
  "ffmpeg +nonfree -x11" \
  gh \
  "ImageMagick -x11" \
  inetutils \
  jq \
  port_cutleaves \
  py-mitmproxy \
  QLColorCode \
  QLStephen \
  shellcheck \
  xcodes \
  yarn \
  youtube-dl \

if test "$WHERE_AM_I" = "H"
  set -a PORTS \
    gpac \
    "hugo +extended" \
    mkvtoolnix \
    mpv \
    xdelta \

end

if test "$WHERE_AM_I" = "W"
  set -a PORTS \
    dnsmasq \
    jmeter \
    nginx \

end

set CURRENT_PORTS (port installed | tail -n+2 | string replace -r ' @.*$' '' | string replace -r '^\s+' '')

for PORT in $PORTS
  set BASE_PORTNAME (string replace -r ' .*' '' $PORT)
  if contains $BASE_PORTNAME $CURRENT_PORTS
    continue
  end

  sudo port install (string split " " $PORT)
end
