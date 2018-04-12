#!/bin/sh

echo "Setting up $USER's Mac..."

# Checking for latest verison
echo "Pulling latest origin from Github"
git pull origin master;

# Update macOS and install Xcode
sudo softwareupdate -i -a
xcode-select --install

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

# Make ZSH from homebrew the default shell environment
echo "Setting ZSH from homebrew as the default shell"
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
which zsh
zsh --version

# Install packages
echo "Installing all global packages"
source "$PWD/packages/apm.sh"
source "$PWD/packages/pip.sh"
source "$PWD/packages/ruby.sh"
source "$PWD/packages/npm.sh"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Symbolic link Home folders to Dropbox
ln -sf ~/Desktop  ~/Dropbox/
ln -sf ~/Documents  ~/Dropbox/
ln -sf ~/Movies  ~/Dropbox/
ln -sf ~/Music  ~/Dropbox/
ln -sf ~/Pictures  ~/Dropbox/

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
ln -sf "$PWD/git/.gitmessage" ~

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
ln -sf ~/Dropbox/Developer/.wakatime.cfg ~
# ln -sf "$PWD/shell/.inputrc" ~
# ln -sf "$PWD/shell/.wgetrc" ~

# Update macOS
echo "Updating macOS"
softwareupdate -lia
echo "Updating all Mac Store Apps"
mas upgrade
echo "Updating all Brew Cask Apps"
brew cu

#Set macOS defaults
echo "Setting up macOS defaults"
source "$PWD/os/macos/macos.sh"

echo "Your Mac has been setup $USER :)"
