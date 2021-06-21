# .bashrc

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
eval $( dircolors -b $HOME/.dotfiles/dircolors-zenburn/dircolors )
alias dir='dir --color'
alias ls='ls --color'

# tmuxinator
alias mux='tmuxinator'
# source ~/.tmuxinator.bash

# Fuzzy find
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
