#!/usr/bin/env fish

read -P "[H]ome or [W]ork? " WHERE_AM_I

set BREWS \
  asimov \

set CASKS \
  betterzip \

if test "$WHERE_AM_I" = "H"
  set -a BREWS \
    mp3val \

end

if test "$WHERE_AM_I" = "W"
  set -a BREWS \
    azure-cli \

  set -a CASKS \
    ngrok \

end

set CURRENT_BREWS (brew list --formula)
set CURRENT_CASKS (brew list --cask)

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

  brew install --cask $CASK
end

echo "Enabling Brew services, you may be prompted for your password"

sudo brew services start asimov
