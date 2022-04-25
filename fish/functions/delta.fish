function delta
  if test (os_theme) = "light"
    set deltaTheme "Solarized (light)"
  else
    set deltaTheme "Solarized (dark)"
  end

  /usr/bin/env delta --syntax-theme $deltaTheme $argv
end
