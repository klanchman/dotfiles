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
  docker-buildx \
  docker-compose \
  docker-credential-helper \
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
  vapor \
  watchexec \
  xh \
  xpdf \
  yarn \
  yq \
  yt-dlp \

set CASKS \
  1password-cli \
  betterzip \

if test (string upper $WHERE_AM_I) = "H"
  set -a BREWS \
    gpac \
    hugo \
    mp3val \
    xdelta \

  set -a CASKS \
    mkvtoolnix \
    mpv \

end

if test (string upper $WHERE_AM_I) = "W"
  set -a BREWS \
    azure-cli \
    jmeter \
    nginx \

  set -a CASKS \
    android-platform-tools \
    ngrok \
    wireshark \

end

set CURRENT_BREWS (brew list --formula)
set CURRENT_CASKS (brew list --cask)

for BREW in $BREWS
  if contains $BREW $CURRENT_BREWS
    set -e BREWS[(contains -i $BREW $BREWS)]
  end
end

if count $BREWS &> /dev/null
  brew install $BREWS
else
  echo "All brews already installed"
end

for CASK in $CASKS
  if contains $CASK $CURRENT_CASKS
    set -e CASKS[(contains -i $CASK $CASKS)]
  end
end

if count $CASKS &> /dev/null
  brew install --cask $CASKS
else
  echo "All casks already installed"
end

echo "Enabling Brew services, you may be prompted for your password"

sudo brew services start asimov

echo "Symlinking Docker plugins"
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-buildx/bin/docker-buildx ~/.docker/cli-plugins/docker-buildx
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
