#!/usr/bin/env fish

set DESTINATION (eval echo (head $CONCERN/$DESTINATION_FILE))
sudo ln -sf (pwd)/macports/archive_sites.conf $DESTINATION/archive_sites.conf
sudo ln -sf (pwd)/macports/macports.conf $DESTINATION/macports.conf
sudo ln -sf (pwd)/macports/sources.conf $DESTINATION/sources.conf

mkdir -p ~/code/macports-local
sudo port selfupdate

set PORTS \
  dotnet-sdk-7 \
  dumpasn1 \
  python27 \

set CURRENT_PORTS (port installed | tail -n+2 | string replace -r ' @.*$' '' | string replace -r '^\s+' '')

for PORT in $PORTS
  set BASE_PORTNAME (string replace -r ' .*' '' $PORT)
  if contains $BASE_PORTNAME $CURRENT_PORTS
    set -e PORTS[(contains -i $PORT $PORTS)]
  end
end

if count $PORTS &> /dev/null
  sudo port -N install $PORTS
else
  echo "All ports already installed"
end
