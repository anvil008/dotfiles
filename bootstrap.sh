#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# Symbolic Link
function doIt() {
	ln -s ~/Github/dotfiles/.aliases ~
	ln -s ~/Github/dotfiles/.bash_profile ~
	ln -s ~/Github/dotfiles/.bash_prompt ~
	ln -s ~/Github/dotfiles/.bashrc ~
	ln -s ~/Github/dotfiles/.curlrc ~
	ln -s ~/Github/dotfiles/.editorconfig ~
	ln -s ~/Github/dotfiles/.exports ~
	ln -s ~/Github/dotfiles/.functions ~
	ln -s ~/Github/dotfiles/.gitattributes ~
	ln -s ~/Github/dotfiles/.gitconfig ~
	ln -s ~/Github/dotfiles/.gitignore ~
	ln -s ~/Github/dotfiles/.hgignore ~
	ln -s ~/Github/dotfiles/.hushlogin ~
	ln -s ~/Github/dotfiles/.hyper.js ~
	ln -s ~/Github/dotfiles/.inputrc ~
	ln -s ~/Github/dotfiles/.path ~
	ln -s ~/Github/dotfiles/.screenrc ~
	ln -s ~/Github/dotfiles/.wgetrc ~
	source ~/.bash_profile;
}

# Rsync Method
# function doIt() {
# 	rsync --exclude ".git/" \
# 				--exclude ".DS_Store" \
# 				--exclude ".osx" \
# 				--exclude "bootstrap.sh" \
# 				--exclude "brew.sh" \
# 				--exclude "brewcash.sh" \
# 				--exclude "chocolatelyinstall.cmd" \
# 				--exclude "LICENSE-MIT.txt" \
# 				--exclude "README.md" \
# 				-avh --no-perms . ~;
# 			source ~/.bash_profile;
# }

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
