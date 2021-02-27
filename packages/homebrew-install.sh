#!/bin/sh

#Taps
brew tap github/gh
brew tap buo/cask-upgrade
brew tap adoptopenjdk/openjdk
brew tap homebrew/cask-versions

#Shell
brew install zsh

#Binaries
brew install speedtest-cli
brew install git
brew install gh
brew install mas
brew install awscli
brew install python
brew install nvm
brew install nano

#Java
brew install adoptopenjdk
brew install adoptopenjdk8

#Casks
brew install gpg-suite-no-mail --no-quarantine
brew install alacritty --no-quarantine
brew install adobe-creative-cloud --no-quarantine
brew install docker --cask --no-quarantine
brew install google-chrome --no-quarantine
brew install github --no-quarantine
brew install visual-studio-code --no-quarantine
brew install jetbrains-toolbox --no-quarantine
brew install keka --no-quarantine
brew install transmit --no-quarantine
brew install whatsapp --no-quarantine
brew install tower --no-quarantine
brew install google-backup-and-sync --no-quarantine
brew install hyper --no-quarantine
brew install microsoft-teams --no-quarantine
brew install zoom --no-quarantine
brew install visual-studio --no-quarantine

#Mas

#GoodNotes
mas install 1444383602
#KeyNote
mas install 409183694
#Magnet
mas install 441258766
#Excel
mas install 462058435
#Powerpoint
mas install 462062816
#RDP
mas install 1295203466
#Word
mas install 462054704
#Numbers
mas install 409203825
#Pages
mas install 409201541
#XCode
mas install 497799835

brew cleanup