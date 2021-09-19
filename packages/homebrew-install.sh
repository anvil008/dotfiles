#!/bin/sh

#Taps
brew tap aws/tap
brew tap github/gh
brew tap buo/cask-upgrade
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

#Shell
# brew install zsh
brew install zsh
brew install pure

#Binaries
brew install git
brew install gh
brew install mas
brew install awscli
brew install aws-sam-cli
brew install python
brew install nvm
brew install nano
brew install speedtest-cli

#Kubernetes
brew install kubectl
brew install minikube

#Java
brew install adoptopenjdk
brew install adoptopenjdk8

#Casks
brew install google-drive --no-quarantine
brew install gpg-suite-no-mail --no-quarantine
brew install alacritty --no-quarantine
brew install docker --cask --no-quarantine
brew install google-chrome --no-quarantine
brew install github --no-quarantine
brew install visual-studio-code --no-quarantine
brew install keka --no-quarantine
brew install transmit --no-quarantine
brew install whatsapp --no-quarantine
brew install tower --no-quarantine
brew install hyper --no-quarantine
brew install microsoft-teams --no-quarantine
brew install zoom --no-quarantine
brew install notion --no-quarantine

#Font
brew install --cask font-jetbrains-mono

#Mas

#Magnet
mas install 441258766
#GoodNotes
mas install 1444383602
#XCode
mas install 497799835