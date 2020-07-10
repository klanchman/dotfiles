# dotfiles

Dotfiles for macOS.

## Prerequisites

- brew
- fish
- git
- mint
- nvm
- rbenv

Run the following script to get prerequisites installed:

```
./bootstrap.sh
```

You'll probably want to have Xcode installed before that though.

## Install

**NB**: Existing files will be overwritten without prompting! Make sure you have a backup.

```
./setup.fish
```

----

## How to Extend

### Behavior

The setup script will look at all directories at the root of this repository ("concerns").
By default, files in the concern will have links created in $HOME with a `.` prepended to the name.
If a `destination` file is present, files in the concern will have links created in the the destination path specified with no modifications to the name.

Directories are traversed such that links will only be created for files, not subdirectories.
Files in subdirectories are still linked, and the directory structure in the repo is used when creating links.
For example, files matching `fish/functions/*.fish` will have links created in `~/.config/fish/functions`.

**NB**: Using the subdirectory behavior with a concern that does not have `destination` file may cause unexpected behavior. When using subdirectories, always specify a destination.

### Custom Destinations

To specify a different destination for the concern, create a file named `destination` with the desired path as the file's contents.

### Custom Setup

To perform custom steps before files are linked, create a `setup.fish` file that does your custom setup.
Scripts are executed from the root of the repository.

### Ignoring Files

To specify filenames that should not be linked to the destination, create a file named `ignores`.
The contents of this file should be a list of filenames, 1 per line, that should not be linked.

Caveats:

- Filenames are run through fish's `string match`, so `*` wildcards work, but globs and other constructs may not
- Filenames are ignored recursively. e.g. Ignoring `*.fish` would ignore `stuff.fish` and `things/stuff.fish`
- Every line of the file is treated as a filename to ignore, i.e. no comments
- The filenames `destination`, `ignores`, and `setup.fish` are _always_ ignored
