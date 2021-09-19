#!/bin/sh

echo "Setting up $USER's Mac..."

# Ask for the administrator password upfront
sudo -v

# Update macOS
echo "Updating macOS"
softwareupdate -lia

# Install Xcode Command Line Tools
xcode-select --install
sudo xcodebuild -license accept

# Check for Homebrew and install if not installed
echo "Checking for Homebrew and installing if not found"
if test ! $(which brew); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/anvil/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
echo "Updating and upgrading Brew"
brew update
brew upgrade

# Install all Homebrew packages
echo "Installing Homebrew packages"
source "$PWD/packages/homebrew-install.sh"
brew cleanup

#Make ZSH from homebrew the default shell environment
echo "Setting ZSH from homebrew as the default shell"
sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh
which zsh
zsh --version

#Install Pure theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Install Node and Yarn through NVM
echo "Installing Node through nvm package manager and Yarn"
mkdir ~/.nvm
## Install latest node version from nvm
nvm install node

# Install packages
echo "Installing npm packages"
source "$PWD/packages/npm.sh"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Symbolic link dotfiles to ~/
echo "Symbolic linking dotfiles..."
echo "Symbolic linking git"
ln -sf "$PWD/git/.gitconfig" ~

echo "Symbolic linking hyper terminal"
ln -sf "$PWD/hyper/.hyper.js" ~

echo "Symbolic linking zsh files"
ln -sf "$PWD/shell/zsh/.zshrc" ~
ln -sf "$PWD/shell/zsh/aliases.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/exports.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/functions.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/path.zsh" ~/.oh-my-zsh/custom/

echo "Symbolic linking extras"
ln -sf "$PWD/shell/.alacritty.yml" ~

echo "Copying private files"
ln -sf /Volumes/GoogleDrive/My\ Drive/Dev\ Tools/private.zsh ~/.oh-my-zsh/custom/    	# Need to update to iCloud Drive
ln -sf /Volumes/GoogleDrive/My\ Drive/Dev\ Tools/.ssh ~/								# Need to update to iCloud Drive
ln -sf /Volumes/GoogleDrive/My\ Drive/Dev\ Tools/.gnupg ~/								# Need to update to iCloud Drive
ln -sf /Volumes/GoogleDrive/My\ Drive/Dev\ Tools/.aws ~/								# Need to update to iCloud Drive

# Update macOS
echo "Updating all Mac Store Apps"
mas upgrade
echo "Updating all Brew Cask Apps"
brew cu --all --force --no-quarantine --cleanup --yes

# Set macOS defaults
# echo "Setting up macOS defaults"
# source "$PWD/os/macos.sh"
# echo "Applying app preferences"
# source "$PWD/os/app-preferences.sh"

#Add SSH key to ssh agent
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_ed25519

echo "."
echo ".."
echo "..."
echo "Your Mac has been setup $USER :)"