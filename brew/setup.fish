#!/usr/bin/env fish

read -P "[H]ome or [W]ork? " WHERE_AM_I

set BREWS \
  carthage \
  ffmpeg \
  mitmproxy \
  yarn \

set CASKS \
  betterzip \
  qlcolorcode \
  qlimagesize \
  qlstephen \

if test "$WHERE_AM_I" = "H"
  set -a BREWS \
    hugo \
    mkvtoolnix \
    mpv \

end

if test "$WHERE_AM_I" = "W"
  # TODO
end

set CURRENT_BREWS (brew list)
set CURRENT_CASKS (brew cask list)

for BREW in $BREWS
  if contains $BREW $CURRENT_BREWS
    continue
  end

  brew install $BREW
end

for CASK in $CASKS
  if contains $CASK $CURRENT_CASKS
    continue
  end

  brew cask install $CASK
end
