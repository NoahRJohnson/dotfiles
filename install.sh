#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# TERMINAL COLORS
# download a terminal emulator which supports true color

# tmux italics fix
tic $DIR/xterm-24bit

for dotfile in "$DIR"/dotfiles/*; do
  fname=$(basename "$dotfile")

  target=~/."$fname"
  copy_target="$DIR"/stash/"$fname"

  # stash old dotfiles
  if [[ -e $target ]]
  then
    cp $target $copy_target
    rm $target
  fi

  # create new symbolic links
  ln -s "$dotfile" "$target"
done

