#!/bin/sh

packages=(
    atom-beautify
    busy-signal
    editorconfig
    file-icons
    intentions
    linter
    linter-ui-default
    minimap
    package-sync
    pigments
    platformio-ide-terminal
    prettier-atom
    react
    react-snippets
    scroll-through-time
    sort-lines
    sorter
    split-diff
    wakatime
)

apm install "${packages[@]}"
