#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# how to undo tic?
# tic $DIR/xterm-24bit

# delete symbolic links
for dotfile in "$DIR"/dotfiles/*; do
  fname=$(basename "$dotfile")

  target=~/."$fname"

  if [[ -e $target ]]
  then
    rm $target
  fi
done

# restore stashed dotfiles
for dotfile in "$DIR"/stash/*; do
  fname=$(basename "$dotfile")

  target=~/."$fname"

  mv "$dotfile" "$target"
done

