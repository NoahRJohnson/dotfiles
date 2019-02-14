#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

git submodule init
git submodule update

# TERMINAL COLORS
#git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# TMUX ITALICS FIX
tic $DIR/xterm-24bit

# SYMBOLIC LINKS
ln -s $DIR/tmux.conf .tmux.conf

