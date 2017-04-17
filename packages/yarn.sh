#!/bin/sh

packages=(
    diff-so-fancy
    git-recent
    git-open
    gulp
    http-server
    servedir
    flow-bin
    flow-typed
    npm-check-updates
    webpack
    nodemon
    svgo
    yo
    xo
    conduct
    trash-cli
    fast-cli
    speed-test
    public-ip
)

yarn global add "${packages[@]}"
