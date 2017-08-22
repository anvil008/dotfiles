#!/bin/sh

export CLICOLOR=1

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;

# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';

# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase shell history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Save history after logout
export SAVEHIST=10000

# History location
export HISTFILE=~/.zhistory

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

export BLOCKSIZE=1k
