function bat
  if test (os_theme) = "light"
    set batTheme "Solarized (light)"
  else
    set batTheme "Solarized (dark)"
  end

  /usr/bin/env bat --theme $batTheme $argv
end
