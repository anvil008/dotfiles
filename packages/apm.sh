#!/bin/sh

packages=(
    atom-beautify
    autocomplete-ruby
    busy-signal
    editorconfig
    file-icons
    intentions
    linter
    linter-ruby
    linter-ui-default
    platformio-ide-terminal
    split-diff
    sync-settings
)

apm install "${packages[@]}"
