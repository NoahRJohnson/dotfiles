"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ***  PREAMBLE  ***                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"

" Lots of inspiration from:
" https://github.com/Valloric/dotfiles/blob/master/vim/vimrc.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      ***  PLUGINS (via vim-plug)  ***                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"** COLORSCHEMES **"

" all the base 16 color schemes
"Plug 'chriskempson/base16-vim'
" dracula
Plug 'dracula/vim',{'as':'dracula'}
" gotham
Plug 'whatyouhide/vim-gotham'
" lucius
Plug 'jonathanfilip/vim-lucius'
" monokai
Plug 'crusoexia/vim-monokai'
" onedark
Plug 'joshdick/onedark.vim'
" solarized
Plug 'altercation/vim-colors-solarized'
" sorcerer
Plug 'vim-scripts/Sorcerer'
" zenburn
Plug 'vim-scripts/Zenburn'

"** DISPLAY MODIFIERS **"

" NERDTree file explorer
Plug 'scrooloose/nerdtree'
" Minimap
Plug 'severin-lemaignan/vim-minimap'
" show indentation
Plug 'nathanaelkane/vim-indent-guides'
" lightweight status bar
Plug 'vim-airline/vim-airline'
" themes for airline
Plug 'vim-airline/vim-airline-themes'
" git status in the sign column
Plug 'airblade/vim-gitgutter'
" Make tmux status line look like vim status line
Plug 'edkolev/tmuxline.vim'
" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" Color matching parens,braces,etc. with matching colors for better readability
Plug 'luochen1990/rainbow'
" Make editing Latex documents nicer
Plug 'LaTeX-Box-Team/LaTeX-Box'

"** AUTO-COMPLETION **"

" super tab for making YCM and ultisnips work together
"Plug 'ervandew/supertab'
" Autocompletion / goto definition / etc.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
" Snippet completion
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" Auto-close quotes, parentheses, brackets, etc.
" Plug 'jiangmiao/auto-pairs'

"** VERBS **"

" Comment text using 'gc'
Plug 'tpope/vim-commentary'
" cp copies / cv pastes to system clipboard
Plug 'christoomey/vim-system-copy'
" gr replaces text with contents of register
Plug 'vim-scripts/ReplaceWithRegister'

"** NOUNS **"

" s -> two character f
" Gives s,f,t a minimal easymotion
Plug 'justinmk/vim-sneak'
" fzf for fuzzy file searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" The Silver Searcher (grep/ack replacement)
Plug 'rking/ag.vim'

"** TEXT OBJECTS **"

" s $TARGET $REPLACE selects surrounding brackets, quotes, etc
" ys adds to surrounding
Plug 'tpope/vim-surround'
" Dependency for other text object plugins
Plug 'kana/vim-textobj-user'
" ii and ai select a block of code by its indentation level
Plug 'kana/vim-textobj-indent'
" 'a$marker' selects all text inside $marker, including the $markers
Plug 'wellle/targets.vim'
" ic and ac selects comments
Plug 'glts/vim-textobj-comment'


" Lets . command use plugins
Plug 'tpope/vim-repeat'

" easy switching between headers and source
Plug 'vim-scripts/a.vim'
" protobuf syntax
Plug 'uarun/vim-protobuf'
" language syntax
Plug 'sheerun/vim-polyglot'
" fugitive for git integration
Plug 'tpope/vim-fugitive'
" undo tree traversal
Plug 'mbbill/undotree'
" lightweight file manager settings
" Plug 'tpope/vim-vinegar'
" explore open buffers
Plug 'jlanzarotta/bufexplorer'
" syntax checking and linting
Plug 'w0rp/ale'
" Convenient mappings for common unixy commands
Plug 'tpope/vim-eunuch'
" Provide seamless pane switching with <ctrl-hjkl\>
Plug 'christoomey/vim-tmux-navigator'

" These need to be the very last plugins for some reason?
" Adds support for NerdFont icons
Plug 'ryanoasis/vim-devicons'
" Adds syntax highlighting to nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
" END PLUGINS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  General Settings  ***                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" DISPLAY SETTINGS
let &t_SI = "\e[6 q"  " | cursor when in insert mode
let &t_SR = "\e[4 q"  " _ cursor when in replace mode
let &t_EI = "\e[2 q"  " block cursor otherwise
" set font for gvim, terminal vim will inherit terminal emulator's font
if has("gui_running")
  set guifont=Source\ Code\ Pro\ 14
endif
" Base16
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
" set background=dark    " enable for dark terminals
" set t_Co=256           " enable 256 colors in terminal
set termguicolors       " enable true color (24-bit color) (needs terminal to support)
" colorscheme onedark    " sets the colorscheme
" colorscheme solarized
colorscheme zenburn
" colorscheme lucius
" LuciusDarkLowContrast
set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set undofile            " stores undo state even when files are closed (in undodir)
"set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu

" autocomplete options
set wildmode=longest:full
set wildmenu  " completion with menu

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab

" EDITOR SETTINGS
set autowriteall        " auto write buffers when switching
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
" this can cause problems with other filetypes
" see comment on this SO question http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
"set smartindent         " smart auto indenting
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4  " c/c++ indentation options. See :h cinoptions-values for description
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.

set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2        " spaces for autoindents
set softtabstop=2
set shiftround          " makes indenting a multiple of shiftwidth
set expandtab           " turn a tab into spaces - use <ctrl-v><tab> to insert a real tab
set laststatus=2        " the statusline is now always shown
set noshowmode          " don't show the mode ("-- INSERT --") at the bottom

" MISC SETTINGS
set mouse=a                " enable mouse in all modes
set number relativenumber  " turn on hybrid line numbers (relative + current line absolute)
:command Andy set rnu!     " Andy doesn't like relative numbers, this option will toggle them
set foldlevelstart=99      " all folds open by default
set nohlsearch             " do not highlight searched-for phrases
set incsearch              " ...but do highlight-as-I-type the search string
set gdefault               " this makes search/replace global by default
set spell spelllang=en_us  " spell checking

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F7>

" Right-click on selection should bring up a menu
set mousemodel=popup_setpos

" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Number of screen lines to use for the command-line
set cmdheight=2

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

" UltiSnips is missing a setf trigger for snippets on BufEnter
"autocmd vimrc BufEnter *.snippets setf snippets

" In UltiSnips snippet files, we want actual tabs instead of spaces for indents.
" US will use those tabs and convert them to spaces if expandtab is set when the
" user wants to insert the snippet.
"autocmd vimrc FileType snippets set noexpandtab

" The stupid python filetype plugin overrides our settings!
autocmd FileType python
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2


"Filetype associations
" txx template files
" For some reason, both of the following lines are needed;
" The first to get YouCompleteMe to respect the filetype on some files, and
" the second to prevent txx files from being recognized as conf type.  I
" don't understand exactly what is causing this, but this seems to work.
au BufNewFile,BufRead *.txx setfiletype cpp
au BufNewFile,BufRead *.txx set filetype=cpp

" disable auto-commenting on subsequent lines
autocmd FileType c,cpp setlocal comments-=:// comments+=f://

" tell vim about italics code.
set t_ZH=[3m
set t_ZR=[23m

" comments look nice in italics
" highlight Comment cterm=italic


" filename *.md  => markdown filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           More involved tweaks                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif


" cindent is a bit too smart for its own good and triggers in text files when
" you're typing inside parens and then hit enter; it aligns the text with the
" opening paren and we do NOT want this in text files!
autocmd FileType text,markdown,gitcommit set nocindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use the space bar as <leader>
map <Space> <leader>

" fast saving
nnoremap <leader>w :w<CR>

" fast quit
nnoremap <leader>q :q<CR>

" fast reload
nnoremap <leader>e :e<CR>

" <Leader>cd changes directory to location of current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" <Leader>z switches to previous buffer
noremap <leader>z :e#<CR>

" <Leader>x deletes current buffer
noremap <leader>x :bd<CR>

" <leader>v brings up vimrc
noremap <leader>v <ESC>:e $MYVIMRC<CR>
" <leader>V sources vimrc, for loading changes
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" for faster scrolling
noremap J 15gj
noremap K 15gk

" since we removed J default binding, remap line join to <leader>j
nnoremap <leader>j J
" likewise for K
nnoremap <leader>k K
" split line (sister to join lines). cc still substitutes the line like S would
nnoremap <leader>s i<CR><Esc>

" These create newlines like o and O but stay in normal mode
noremap <leader>o o<Esc>k
noremap <leader>O O<Esc>j

" Enter a space without leaving normal mode
nnoremap <leader><leader> i<Space><Esc>

" shortcut for Cmake
noremap <leader>c :Cmake<CR>

map Y y$            " Y yanks to end of line

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Also center the screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" Alt-hjkl to exit insert mode
inoremap <M-h> <ESC>h
inoremap <M-j> <ESC>j
inoremap <M-k> <ESC>k
inoremap <M-l> <ESC>l

" Enter to exit insert mode
inoremap <CR> <ESC>

" Use Escape to exit terminal mode (neovim only)
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" vim-tmux-navigator does this
" simplify moving between windows
" map <C-h> <C-w>h
" map <C-l> <C-w>l
" map <C-j> <C-w>j
" map <C-k> <C-w>k

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  PLUGIN SETTINGS  ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  A.VIM  ***                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:alternateExtensions_h = "c,cpp,cxx,txx,hpp,hxx,C,CPP,CXX,TXX,HPP,HXX"
let g:alternateExtensions_H = "c,cpp,cxx,txx,hpp,hxx,C,CPP,CXX,TXX,HPP,HXX"
let g:alternateExtensions_txx = "h,H"
let g:alternateExtensions_TXX = "h,H"
let g:alternateExtensions_hxx = "h,H"
let g:alternateExtensions_HXX = "h,H"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            ***  AG  ***                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fuzzy file searching via ctrl-P
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" " <Leader>p shortcut
" nnoremap <leader>p <C-p>
" " use nearest ancestor containing .git file, or cwd
" let g:ctrlp_working_path_mode = 'ra'

" " use the silver searcher if available
" if executable("ag")
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"
"       \ --ignore BoostParts
"       \ -g ""'
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             ***  ALE  ***                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" analog of n and N for navigating to linting errors
nnoremap <leader>a :ALENextWrap<cr>
nnoremap <leader>A :ALEPreviousWrap<cr>

" automatically populate vim's location list with errors
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" use flake8 for python code
let g:ale_linters = {'python': ['flake8']}

" ignore these pep8 warnings:
" E111: indents not a multiple of four
" E114: indents not a multiple of four (for a comment)
" E121: continuation line under-indented for hanging indent
" E129: visually indented line with same indent as next logical line
" E201: whitespace after '('
" E202: whitespace before ')'
" E221: multiple spaces before operator
" E222: multiple spaces after operator
" E241: multiple spaces after ','
" E251: unexpected spaces around keyword / parameter equals
" E266: too many leading '#' for block comment
" E303: too many blank lines
" E501: lines over 80 characters
" E701: multiple statements on one line (colon)
" E722: do not use bare 'except'
" W391: blank lines at eof
"let g:ale_python_flake8_options = '--ignore=E501,E201,E202,E221,E225,E226,E227,E228,E231,W391'
let g:ale_python_flake8_options = '--ignore=E111,E114,E121,E125,E126,E129,E201,E202,E221,E222,E241,E251,E266,E303,E501,E701,E722,W391'

" let g:ale_fixers = {'python': ['isort']}

" Run ale fixer on saving
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        ***  AUTO-PAIRS  ***                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"au FileType html,xhtml,markdown let g:AutoPairs = {'(':')', '[':']', '{':'}'}

" Turn off quote closing in vim script, since we use quotes for comments
" au FileType vim let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'","`":"`", '```':'```',"'''":"'''"}

" highlight and jump between matching angle brackets.
" This is useful for heavily templated C++
"au FileType c,cpp let g:AutoPairs = "<:>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  BUFEXPLORER  ***                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <Leader>b saves current buffer then loads bufexplorer
noremap <silent> <leader>b :w<CR>:BufExplorer<CR>
" disable default mappings so vim doesn't wait to see if <Leader>b[x] is going to be pressed
let g:bufExplorerDisableDefaultKeyMapping=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ***  FZF  ***                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader>p as Ctrl-P analog to search files
nnoremap <leader>p :FZF<CR>

" <leader>f for "find" which searches within files using the silver searcher
nnoremap <leader>f :Ag! -Q 

" Hide status line of current buffer when fzf opens underneath (fzf window
" will have the status line replicated)
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ***  MUNDO  ***                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" persist undo information
set undofile
set undodir=~/.vim/undo

" mapping for Mundo plugin
nnoremap <leader>u :MundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  NERDTREE  ***                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
"

" <leader>n opens nerdtree window on current buffer
nnoremap <leader>n :NERDTreeFind<CR>

" close nerdtree window after opening a file with any of o,i,t,T
let g:NERDTreeQuitOnOpen = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  RAINBOW  ***                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active=0                  " off by default
nnoremap <leader>r :RainbowToggle<CR>   " toggle with <leader>r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  ULTISNIPS  ***                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" we can't use <tab> as our snippet key since we use that with YouCompleteMe
let g:UltiSnipsSnippetsDir         = $HOME . '/.vim/UltiSnips'
let g:UltiSnipsListSnippets        = "<c-m-s>"
let g:UltiSnipsJumpForwardTrigger  = "<right>"
let g:UltiSnipsJumpBackwardTrigger = "<left>"
"let g:UltiSnipsExpandTrigger       = "<CR>"
let g:snips_author                 = 'Strahinja Val Markovic'

" let g:UltiSnipsExpandTrigger = "<nop>"
" let g:ulti_expand_or_jump_res = 0
" function ExpandSnippetOrCarriageReturn()
"     let snippet = UltiSnips#ExpandSnippetOrJump()
"     if g:ulti_expand_or_jump_res > 0
"         return snippet
"     else
"         return "\<CR>"
"     endif
" endfunction
" inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"

" Generate SPHINX-style (numpy-style) documents in snippets
let g:ultisnips_python_style = "sphinx"

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  YOUCOMPLETEME  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_server_python_interpreter = '/usr/bin/python'

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>  " goto definition
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>               " compile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ***  VIM-AIRLINE  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" airline already copies the set colorscheme, but change this
" if you want a distinct colorscheme for the status
let g:airline_theme='lucius'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ***  VIM-DEVICONS  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show glyphs
set encoding=utf8

" vim-airline support for nerdfont
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        ***  VIM-INDENT-GUIDES  ***                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable by default
let g:indent_guides_enable_on_vim_startup = 0

" default toggle is <leader>ig
" set to 0 to make our own toggle mapping
let g:indent_guides_default_mapping = 1
" just make sure no other plugins use a <leader>i map or else there will be a delay
"nnoremap <leader>i :IndentGuidesToggle<CR>

" don't display first-level indentation
let g:indent_guides_start_level = 2

" make indentation bars smaller width
let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ***  VIM-MINIMAP  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader>mt to toggle
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  VIM-SNEAK  ***                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" these are the defaults. you can change them if you want to keep the default 's' map
"nmap s <Plug>Sneak_s
"nmap S <Plug>Sneak_S

" Replace f and t with 1-character sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" minimalist easymotion
let g:sneak#streak = 1

" allow 'ignorecase' and 'smartcase' settings to determine case-sensitivity
let g:sneak#use_ic_scs = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ***  VIM-TMUX-NAVIGATOR  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ***  VIM-VINEGAR  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use - to open netrw file explorer
" toggle directory banner with I

" start with tree view by default, use i to cycle through view types
" let g:netrw_liststyle = 3

" hide dot files by default, press gh to toggle
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***    ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
