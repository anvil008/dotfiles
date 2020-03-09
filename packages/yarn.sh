#!/bin/sh

packages=(
		conduct
		create-react-app
		gatsby-cli
		git-open
		git-recent
		gulp
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

yarn global add "${packages[@]}"
