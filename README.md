# Anvil's Dotfiles

This is my personal collection of dotfiles which is based around bash.
It uses symbolic links to link the files from the dotfiles folder to your home folder. Personally I keep the dotfiles in my Dropbox and symlink it from there, so it's updated across multiple devices in real-time. However it works even from your Github folder. (Just need to change the symbolic link to your Github folder instead of Dropbox)

It is primarily based of Mathias's dotfiles, however with updated features such a Brewfile instead of brew.sh, a hyper.js setup, and symlinking the dotfiles and also include a chocolately and just-install script for Windows users.


## Installation
---

Change the symbolic links to your personal Dropbox folder or Github folder in the `setup.sh` file.

For example to   
`ln -sf ~/Dropbox/Developer/dotfiles/.aliases ~`  
to  
`ln -sf ~/Github/dotfiles/.aliases ~`  

To run the setup file.  
`source setup.sh`


## Personalization
---

The `setup.sh` file should show what it does in the comments.
A bit of personalization is required for certain matters such as the automatic installation from the Mac App Store, as it would only install apps that the person owns only.

### Mac App Store
Therefore change the brew mas installation in the `Brewfile`.

### Homebrew Cask Packages
Manually specifying the homebrew cask apps is self-explanatory.

### Atom packages
The atom package-sync package should keep atom packages synced and updated (not in real-time, have to manually run the sync command) These packages are found in the `.atom/packages.cson`
