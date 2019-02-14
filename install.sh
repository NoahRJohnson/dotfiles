#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# TERMINAL COLORS
# download a terminal emulator which supports true color

# TMUX ITALICS FIX
tic $DIR/xterm-24bit

# REMOVE OLD SYMBOLIC LINKS
rm ~/.bashrc
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc

# CREATE NEW SYMBOLIC LINKS
ln -s $DIR/bashrc ~/.bashrc
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/zshrc ~/.zshrc
