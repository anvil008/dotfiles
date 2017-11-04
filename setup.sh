#!/bin/sh

git pull origin master;

echo "Setting up $USER's Mac..."

# Check for Homebrew and install if not installed
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl sSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
cd os/mac
brew bundle
cd ..
cd ..

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install packages
source "$PWD/packages/yarn.sh"
source "$PWD/packages/apm.sh"

#Symbolic link dotfiles to ~/
ln -sf "$PWD/atom/config.cson" ~/.atom/
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
# ln -sf "$PWD/shell/.curlrc" ~
ln -sf "$PWD/shell/.editorconfig" ~
ln -sf "$PWD/shell/.hushlogin" ~
# ln -sf "$PWD/shell/.inputrc" ~
# ln -sf "$PWD/shell/.wgetrc" ~
# ln -sf "$PWD/shell/bash/.bash_profile" ~
# ln -sf "$PWD/shell/bash/.bash_prompt" ~
# ln -sf "$PWD/shell/bash/.bashrc" ~
# source "$PWD/shell/bash/.bash_profile"
# ln -sf "$PWD/themes/zsh-prompts/pure/async.zsh" ~/.oh-my-zsh/custom/async.zsh
# ln -sf "$PWD/themes/zsh-prompts/pure/pure.zsh" ~/.oh-my-zsh/custom/pure.zsh-theme
ln -sf ~/Dropbox/Developer/private.zsh ~/.oh-my-zsh/custom/

#Set macOS defaults
source "$PWD/os/mac/macos.sh"

echo "Your Mac has been setup $USER"
