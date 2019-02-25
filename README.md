# dotfiles
* vimrc
* inputrc

## Install

The install script will create all the symlinks for you.

```bash
git clone https://github.com/NoahRJohnson/dotfiles ~/.dotfiles
git submodule init
git submodule update
~/.dotfiles/install.sh
```

## Terminal Emulator

Make sure your terminal supports 24-bit color.

The install script will install Sauce Code Pro, the [Nerd Font](https://github.com/ryanoasis/nerd-fonts) version of Source Code Pro. Open your terminal's preferences and change the font to Sauce Code Pro.

Depending on your terminal emulator you'll have different ways to download color schemes. If you're using Tilix then just follow the directions [here](https://github.com/storm119/Tilix-Themes/blob/master/Themes.md). I recommend Zenburn.

## Zsh
Install with your package manager, e.g.:
```bash
sudo dnf install zsh
```

Install [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) for configuring zsh.

The zshrc in this repo adds git, tmux, vi-mode, and web search support via plugins. Just type 'google $TERM' to open a browser searching google for $TERM.

## Vim
Most distros already have vim installed.

Vim-plug should be automatically downloaded when you first run vim with this vimrc. Run :PlugInstall from inside a vim instance to install plugins.

Install [flake8](https://pypi.org/project/flake8/) to support Vim python linting.

## Tmuxinator
A tool for automating tmux setup.

Install ruby gem installer with your package manager, e.g.:
```bash
sudo dnf install gem
```

Then install tmuxinator with
```
gem install tmuxinator
```

This will ensure you get the most up-to-date version. Check that it was set up correctly by running:
```
mux doctor
```
You should see all "YES".

For every project you're working on create a ".tmuxinator.yml" file in your project root. There are example files for you to copy in this repo. Modify it as needed, then start your project from the project root with
```
mux
```

which will load the local file and set up your tmux session with the name specified in the .yml configuration file. From here on out you can interact normally with this session through tmux.

To kill a session, run

```
mux stop .
```

from the project root.

To see existing projects,
```
mux ls
```
If you end up closing tmux but want to re-attach to your session, use
```
mux ls
```
to see existing projects, and
```
mux start $PROJECT_NAME
```
to re-attach.
```
mux stop $PROJECT_NAME
```
will 

