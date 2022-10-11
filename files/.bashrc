# .bashrc

# Set VIM mode
set -o vi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

export VISUAL=gvim
export EDITOR="vim"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

# Set zenburn scheme for dir and ls
eval $( TERM=xterm-256color dircolors -b $HOME/.dotfiles/dircolors-zenburn/dircolors )
alias dir='dir --color'
alias ls='ls --color'

# tmuxinator
alias mux='tmuxinator'
# source ~/.tmuxinator.bash

# Fuzzy find
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# NAME
#   autojust - Auto source your just setup file, and start using just
function just()
{
  if [[ $(type -at just) == *file* ]]; then
    unset just
    command just ${@+"${@}"}
  elif [ -e setup.env ]; then
    . setup.env
    unset just
    just ${@+"${@}"}
  elif [ "${PWD}" != "/" ]; then
    pushd .. >& /dev/null
    just ${@+"${@}"}
    popd >& /dev/null
  else
    command just ${@+"${@}"}
  fi
}

alias andymode='gnome-terminal -- env INPUTRC=/dev/null bash'
alias ssh2="ssh -o ControlPath=none"
alias ssh_close='ssh -O exit'
