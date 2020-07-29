#!/bin/sh

packages=(
		conduct
		create-react-app
		gatsby-cli
		ghost-cli
		git-open
		git-recent
		gulp
		http-server
		nodemon
		npm-check-updates
		pure-prompt
		svgo
		trash-cli
		xo
		yo
)

npm install -g "${packages[@]}"
