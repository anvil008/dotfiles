#!/bin/sh

packages=(
		pure-prompt
		create-react-app
		gatsby-cli
		ghost-cli
		gulp
)

npm install -g "${packages[@]}"
