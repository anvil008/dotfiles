#!/bin/sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl sSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
# brew update
# brew upgrade

# Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
# brew bundle

# Make ZSH the default shell environment
# chsh -s $(which zsh)

# Install global NPM packages
sudo npm install --global yarn

# Install Atom's package manager sync
apm install package-sync

#Symbolic link dotfiles  to ~/
ln -sf ~/Dropbox/Developer/dotfiles/.atom/config.cson ~/.atom/
ln -sf ~/Dropbox/Developer/dotfiles/.atom/init.coffee ~/.atom/
ln -sf ~/Dropbox/Developer/dotfiles/.atom/keymap.cson ~/.atom/
ln -sf ~/Dropbox/Developer/dotfiles/.atom/packages.cson ~/.atom/
ln -sf ~/Dropbox/Developer/dotfiles/.atom/snippets.cson ~/.atom/
ln -sf ~/Dropbox/Developer/dotfiles/.atom/styles.less ~/.atom/
ln -sf ~/Dropbox/Developer/dotfiles/.aliases ~
ln -sf ~/Dropbox/Developer/dotfiles/.bash_profile ~
ln -sf ~/Dropbox/Developer/dotfiles/.bash_prompt ~
ln -sf ~/Dropbox/Developer/dotfiles/.bashrc ~
ln -sf ~/Dropbox/Developer/dotfiles/.curlrc ~
ln -sf ~/Dropbox/Developer/dotfiles/.editorconfig ~
ln -sf ~/Dropbox/Developer/dotfiles/.exports ~
ln -sf ~/Dropbox/Developer/dotfiles/.functions ~
ln -sf ~/Dropbox/Developer/dotfiles/.gitattributes ~
ln -sf ~/Dropbox/Developer/dotfiles/.gitconfig ~
ln -sf ~/Dropbox/Developer/dotfiles/.gitignore ~
ln -sf ~/Dropbox/Developer/dotfiles/.hgignore ~
ln -sf ~/Dropbox/Developer/dotfiles/.hushlogin ~
ln -sf ~/Dropbox/Developer/dotfiles/.hyper.js ~
ln -sf ~/Dropbox/Developer/dotfiles/.inputrc ~
ln -sf ~/Dropbox/Developer/dotfiles/.path ~
ln -sf ~/Dropbox/Developer/dotfiles/.private ~
ln -sf ~/Dropbox/Developer/dotfiles/.screenrc ~
ln -sf ~/Dropbox/Developer/dotfiles/.wgetrc ~
source ~/.bash_profile;

# Set macOS preferences
source .macos
