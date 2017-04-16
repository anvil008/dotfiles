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
npm install --g xo
npm install --g yarn
npm install --g conduct
npm install --g trash-cli
npm install --g fast-cli
npm install --g speed-test
npm install --g public-ip

# Install Atom's package manager sync
# apm install package-sync

# Set macOS preferences
# source .macos
