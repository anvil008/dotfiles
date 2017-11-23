#!/bin/sh

echo "Setting up $USER's Mac..."

# Checking for latest verison
echo "Pulling latest origin from Github"
git pull origin master;

# Check for Homebrew and install if not installed
echo "Checking for Brew and installing if not found"
if test ! $(which brew); then
	/usr/bin/ruby -e "$(curl sSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
echo "Updating and upgrading Brew"
brew update
brew upgrade

# Install all dependencies with bundle (See Brewfile)
echo "Installing Homebrew bundle"
brew tap homebrew/bundle
cd os/macos
brew bundle
cd ..
cd ..
brew cleanup

#Install package managers that are not suitable to be installed through Homebrew
echo "Installing npm"
npm install npm -g

# Install Mac-CLI
echo "Installing Mac-CLI"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

# Make ZSH from homebrew the default shell environment
echo "Setting ZSH from homebrew as the default shell"
chsh -s /usr/local/bin/zsh

# Install packages
echo "Installing all global packages"
source "$PWD/packages/apm.sh"
source "$PWD/packages/pip.sh"
source "$PWD/packages/ruby.sh"
source "$PWD/packages/npm.sh"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Symbolic link dotfiles to ~/
echo "Symbolic linking dotfiles"

ln -sf "$PWD/atom/config.cson" ~/.atom/
ln -sf "$PWD/atom/github.cson" ~/.atom/
ln -sf "$PWD/atom/init.coffee" ~/.atom/
ln -sf "$PWD/atom/keymap.cson" ~/.atom/
ln -sf "$PWD/atom/packages.cson" ~/.atom/
ln -sf "$PWD/atom/snippets.cson" ~/.atom/
ln -sf "$PWD/atom/styles.less" ~/.atom/

ln -sf "$PWD/git/.gitattributes" ~
ln -sf "$PWD/git/.gitconfig" ~
ln -sf "$PWD/git/.gitignore_global" ~

ln -sf "$PWD/hyper/.hyper.js" ~

ln -sf "$PWD/shell/zsh/.zshrc" ~
ln -sf "$PWD/shell/zsh/aliases.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/exports.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/functions.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/path.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/zsh-plugins/zsh-autosuggestions" ~/.oh-my-zsh/custom/plugins
ln -sf "$PWD/shell/zsh/zsh-plugins/zsh-syntax-highlighting" ~/.oh-my-zsh/custom/plugins

ln -sf "$PWD/shell/.editorconfig" ~
ln -sf "$PWD/shell/.hushlogin" ~

ln -sf ~/Dropbox/Developer/private.zsh ~/.oh-my-zsh/custom/
# ln -sf "$PWD/shell/.inputrc" ~
# ln -sf "$PWD/shell/.wgetrc" ~
# ln -sf "$PWD/shell/bash/.bash_profile" ~
# ln -sf "$PWD/shell/bash/.bash_prompt" ~
# ln -sf "$PWD/shell/bash/.bashrc" ~
# source "$PWD/shell/bash/.bash_profile"s

# Update macOS
echo "Installing macOS updates"
softwareupdate -lia

#Set macOS defaults
echo "Setting up macOS defaults"
source "$PWD/os/macos/macos.sh"

echo "Your Mac has been setup $USER :)"
