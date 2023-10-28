#!/usr/bin/env fish

read -P "[H]ome or [W]ork? " WHERE_AM_I

set BREWS \
  asimov \
  bash \
  bat \
  carthage \
  choose-rust \
  cloc \
  colima \
  docker \
  eza \
  fd \
  ffmpeg \
  gh \
  git-delta \
  glab \
  imagemagick \
  inetutils \
  jless \
  jo \
  jq \
  mitmproxy \
  qrencode \
  shellcheck \
  unxip \
  xh \
  xpdf \
  yarn \
  yq \
  yt-dlp \

set CASKS \
  1password-cli \
  betterzip \

if test "$WHERE_AM_I" = "H"
  set -a BREWS \
    gpac \
    hugo \
    mp3val \
    xdelta \

  set -a CASKS \
    mkvtoolnix \
    mpv \

end

if test "$WHERE_AM_I" = "W"
  set -a BREWS \
    azure-cli \
    jmeter \
    nginx \

  set -a CASKS \
    ngrok \
    wireshark

end

set CURRENT_BREWS (brew list --formula)
set CURRENT_CASKS (brew list --cask)

for BREW in $BREWS
  if set INSTALLED_INDEX (contains -i $BREW $CURRENT_BREWS)
    set -e BREWS[$INSTALLED_INDEX]
  end
end

brew install $BREWS

for CASK in $CASKS
  if set INSTALLED_INDEX (contains -i $CASK $CURRENT_CASKS)
    set -e CASKS[$INSTALLED_INDEX]
  end
end

brew install --cask $CASKS

echo "Enabling Brew services, you may be prompted for your password"

sudo brew services start asimov
