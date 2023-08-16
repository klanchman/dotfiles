function andemu_run
  argparse 'n/name=' -- $argv
  or exit 1

  if not set -q _flag_name
    echo "Missing --name/-n argument"
    return 1
  end

  ~/Library/Android/sdk/emulator/emulator -avd $_flag_name &> /dev/null &
end
