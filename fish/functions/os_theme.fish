function os_theme
  set -l mode "light"

  set -l val (defaults read -g AppleInterfaceStyle &> /dev/null) > /dev/null
  if test $status -eq 0
    set mode "dark"
  end

  echo $mode
end
