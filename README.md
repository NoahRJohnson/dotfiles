# My dot files

Here are my dot files

See https://github.com/andyneff/dot_core for more info, including how to use this pattern for yourself.

# Setting up on a new computer

1. `git clone https://github.com/NoahRJohnson/dotfiles.git ~/.dotfiles`
2. `~/.dotfiles/install.bsh`

All files in the files/ directory will be symlinked into your host computer.

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

### Linting
Install [flake8](https://pypi.org/project/flake8/) to support Vim python linting.

### YouCompleteMe
For every cpp project, add the line
```
set(CMAKE_EXPORT_COMPILE_COMMANDS "ON")
```
to your CMakeLists.txt CMake file. This will generate a compile_commands.json file when you run cmake. Copy that file into your project root. YCM will then automatically load this clang compilation database when you run vim.

## Tmuxinator
A tool for automating tmux setup.

Run setup_tmuxinator.bsh to install gem and tmuxinator.

This will ensure you get the most up-to-date version. Check that it was set up correctly by running:
```
mux doctor
```
You should see all "YES".

For every project you're working on create a ".tmuxinator.yml" file in your project root. "tmuxinator.yml" is an example file for you to start from. Modify it as needed, then start your project from the project root with
```bash
mux
```

which will load the local file and set up your tmux session with the name specified in the .yml configuration file. From here on out you can interact normally with this session through tmux. The default way to exit tmux is "Ctrl-b d". "mux" can also be used to re-attach to a session.

To kill a session, run
```
mux stop .
```
from the project root.


I've yet to figure out how to allow
```
mux ls
mux start $PROJECT_NAME
mux stop $PROJECT_NAME
```
to work when using local config files like this. Personally I'm ok with always having to navigate to a project's root to start the tmux dev environment. If you aren't look into symbolically linking the local files to ~/.tmuxinator/<projectname>.yml

