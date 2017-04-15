#!/bin/sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl sSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
# chsh -s $(which zsh)

# Install global NPM packages
sudo npm install --global yarn

# Install Atom's package manager sync
apm install package-sync

#Symbolic link dotfiles  to ~/
ln -sf ~/Github/dotfiles/.atom/config.cson ~/.atom/
ln -sf ~/Github/dotfiles/.atom/init.coffee ~/.atom/
ln -sf ~/Github/dotfiles/.atom/keymap.cson ~/.atom/
ln -sf ~/Github/dotfiles/.atom/packages.cson ~/.atom/
ln -sf ~/Github/dotfiles/.atom/snippets.cson ~/.atom/
ln -sf ~/Github/dotfiles/.atom/styles.less ~/.atom/
ln -sf ~/Github/dotfiles/.aliases ~
ln -sf ~/Github/dotfiles/.bash_profile ~
ln -sf ~/Github/dotfiles/.bash_prompt ~
ln -sf ~/Github/dotfiles/.bashrc ~
ln -sf ~/Github/dotfiles/.curlrc ~
ln -sf ~/Github/dotfiles/.editorconfig ~
ln -sf ~/Github/dotfiles/.exports ~
ln -sf ~/Github/dotfiles/.functions ~
ln -sf ~/Github/dotfiles/.gitattributes ~
ln -sf ~/Github/dotfiles/.gitconfig ~
ln -sf ~/Github/dotfiles/.gitignore ~
ln -sf ~/Github/dotfiles/.hgignore ~
ln -sf ~/Github/dotfiles/.hushlogin ~
ln -sf ~/Github/dotfiles/.hyper.js ~
ln -sf ~/Github/dotfiles/.inputrc ~
ln -sf ~/Github/dotfiles/.path ~
ln -sf ~/Github/dotfiles/.screenrc ~
ln -sf ~/Github/dotfiles/.wgetrc ~
ln -sf ~/Dropbox/Developer/dotfiles/.private ~
source ~/.bash_profile;

# Set macOS preferences
source .macos
