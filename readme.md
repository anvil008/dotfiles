# Anvil's Dotfiles

<p align="center">
  <img src="/screenshot.png">
</p>

This is my set of dotfiles which is primarily based around zsh, hyper.js, brewfile, chocolately (for Windows users). It uses symbolic links to link the files from the dotfiles folder to your home folder.

Bash dotfiles are included based of Mathias's dotfiles (currently not in use). The zsh dotfiles uses the oh-my-zsh framework with custom dotfiles in the custom folder.

## Installation

Clone the repository.
```shell
git clone https://github.com/anvil008/dotfiles.git
```

Change the following symbolic link to link your personal private.zsh file (containing private keys) in `setup.sh` file.

```shell
ln -sf ~/Dropbox/Developer/dotfiles/.private ~
```
To run the setup file.
```shell
source setup.sh
```

### Personalization

#### Mac App Store
Mac apps to be installed can be set in `macos/Brewfile`.  
(Note : it will only install apps that the user owns only.)

#### Homebrew Packages
Brew packages and cask packages can be set in `packages/apm.sh`.

#### Atom packages
Atom packages can be set in `packages/apm.sh`.

#### Npm/Yarn packages
Yarn/Npm packages can be set in `packages/yarn.sh`.


## Maintainers

[@anvil008](https://github.com/anvil008)

## Contribute

Feel free to dive in! [Open an issue](https://github.com/anvil008/dotfiles/issues/new) or submit PRs.  
Dotfiles follows the [Contributor Code of Conduct](code-of-conduct.md).  
By participating in this project you agree to abide by its terms.

## License

[MIT](LICENSE) © Anvil Palamattam
