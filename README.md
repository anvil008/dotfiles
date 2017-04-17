# Anvil's Dotfiles

<p align="center">
  <img src="/screenshot.png">
</p>

This is my personal collection of dotfiles which is primarily based around zsh, hyper.js, brewfile, chocolately(for Windows users). It uses symbolic links to link the files from the dotfiles folder to your home folder.

There is an older bash folder with bash dotfiles which is based of Mathias's dotfiles. The zsh mostly uses the oh-my-zsh framework.

## Installation

Clone the repository.
```shell
git clone https://github.com/anvil008/dotfiles.git
```

Change the following symbolic link to link your personal private.zsh file in `link_setup.sh` file.

```shell
ln -sf ~/Dropbox/Developer/dotfiles/.private ~
```
To run the setup file.
```shell
source macsetup.sh
source linksetup.sh
```

### Personalization

The `setup.sh` file should describe primarily what it does in the comments. A bit of personalization is required for certain matters such as the automatic installation from the Mac App Store, as it would only install apps that the user owns only.

#### Mac App Store
Therefore change the brew mas installations in the `Brewfile`.

#### Homebrew Cask Packages
Manually specifying the homebrew cask apps required is self-explanatory.

#### Atom packages
The atom package-sync package should keep atom packages synced and updated (not in real-time, have to manually run the sync command) These packages are found in the `.atom/packages.cson`.

## Maintainers

[@anvil008](https://github.com/anvil008)

## Contribute

Feel free to dive in! [Open an issue](https://github.com/anvil008/dotfiles/issues/new) or submit PRs.  
Dotfiles follows the [Contributor Code of Conduct](code-of-conduct.md).  
By participating in this project you agree to abide by its terms.

## License

[MIT](LICENSE) © Anvil Palamattam
