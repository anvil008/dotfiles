# Anvil's Dotfiles

This is my personal collection of dotfiles which is primarily based around bash.
It uses symbolic links to link the files from the dotfiles folder to your home folder. Personally I keep the dotfiles in my Dropbox and symlink it from there, so it's updated across multiple devices in real-time. However it works even from your Github folder.

It is based of Mathias's dotfiles, however with updated features such a Brewfile instead of brew.sh, a hyper.js setup, and symlinking the dotfiles and also include a chocolately and just-install script for Windows users.

## Installation

Change the symbolic link to link your .private file in `setup.sh` file.

```bash
ln -sf ~/Dropbox/Developer/dotfiles/.private ~
```
to
```bash
ln -sf ~/User/dotfiles/.private ~
```
To run the setup file
```bash
source setup.sh
```

### Personalization

The `setup.sh` file should describe primarily what it does in the comments.
A bit of personalization is required for certain matters such as the automatic installation from the Mac App Store, as it would only install apps that the user owns only.

#### Mac App Store
Therefore change the brew mas installations in the `Brewfile`.

#### Homebrew Cask Packages
Manually specifying the homebrew cask apps is self-explanatory.

#### Atom packages
The atom package-sync package should keep atom packages synced and updated (not in real-time, have to manually run the sync command) These packages are found in the `.atom/packages.cson`.

## Maintainers

[@anvil008](https://github.com/anvil008)

## Contribute

Feel free to dive in! [Open an issue](https://github.com/anvil008/dotfiles/issues/new) or submit PRs.  
Dotfiles follows the [Contributor Covenant](http://contributor-covenant.org/version/1/4/) Code of Conduct.

## License

[MIT](LICENSE) © Anvil Palamattam
