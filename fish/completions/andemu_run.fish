set -l avds (andemu -list-avds)
complete --command andemu_run --exclusive -o n -l name -a "$avds"
