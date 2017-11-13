#!/bin/sh

packages=(
		pure-prompt
		git-recent
    git-open
    gulp-cli
    http-server
    npm-check-updates
    nodemon
    svgo
    yo
    xo
    conduct
    trash-cli
    fast-cli
    speed-test
)

npm install -g "${packages[@]}"
