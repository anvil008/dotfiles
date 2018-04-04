# Anvil's Dotfiles

<p align="center">
  <img src="/screenshot.png">
</p>

## Background

Personal set of dotfiles which is primarily based around zsh, hyper.js, brewfile. It uses symbolic links to link the files from the dotfiles folder to your home folder.

The zsh dotfiles uses the oh-my-zsh framework with custom dotfiles in the custom folder.

## Installation

1. Clone the repository.
```shell
git clone https://github.com/anvil008/dotfiles.git
```

1.  Edit /etc/shells to add a new entry for the Homebrew ZSH.
```shell
sudo nano /etc/shells
```

  At the end of the file add /usr/local/bin/zsh, which is the path to the Homebrew binary for ZSH. Your /etc/shells should look like this:
```shell
/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/zsh
```

1. Change the following symbolic link to link your personal private.zsh file (containing private keys) in `setup.sh` file.
```shell
ln -sf ~/Dropbox/Developer/dotfiles/.private
```

1. To run the setup file.
```shell
source setup.sh
```

1. Use the theme Snazzy.terminal from the themes/terminal-snazzy folder.

### Personalization

#### Mac App Store
Mac apps to be installed can be set in `macos/Brewfile`.  
(Note : it will only install apps that the user owns only.)

#### Homebrew Packages
Brew packages and cask packages can be set in `macos/Brewfile`.

#### Atom packages
Atom packages can be set in `atom/packages.cson`.  
They can be installed running the Sync Packages command from the `package-sync` package.

#### Packages installations
Global packages can be set in packages folder for each package manager.

## Maintainers

[@anvil008](https://github.com/anvil008)

## Contribute

Feel free to dive in! [Open an issue](https://github.com/anvil008/dotfiles/issues/new) or submit PRs.  
Dotfiles follows the [Contributor Code of Conduct](code-of-conduct.md).  
By participating in this project you agree to abide by its terms.

## License

[MIT](license.md) © Anvil Palamattam
