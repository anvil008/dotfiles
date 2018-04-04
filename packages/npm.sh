#!/bin/sh

packages=(
		conduct
		create-react-app
		fast-cli
		git-open
		git-recent
		gulp-cli
		http-server
		nodemon
		npm-check-updates
		pure-prompt
		speed-test
		svgo
		trash-cli
		xo
		yo
)

npm install -g "${packages[@]}"
