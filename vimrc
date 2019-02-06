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

"let vimplug_root = $HOME . "/vim-config/plugged"
call plug#begin('~/.vim/plugged')

" solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" onedark color scheme
Plug 'joshdick/onedark.vim'
" zenburn color scheme
Plug 'vim-scripts/Zenburn'
" easy switching between headers and source
Plug 'vim-scripts/a.vim'
" protobuf syntax
Plug 'uarun/vim-protobuf'
" language syntax
Plug 'sheerun/vim-polyglot'
" fugitive for git integration
Plug 'tpope/vim-fugitive'
" Ctrl-P for fuzzy file searching
Plug 'kien/ctrlp.vim'
" undo tree traversal
Plug 'mbbill/undotree'
" lightweight status bar
Plug 'vim-airline/vim-airline'
" themes for airline
Plug 'vim-airline/vim-airline-themes'
" lightweight file manager settings
Plug 'tpope/vim-vinegar'
" explore open buffers
Plug 'jlanzarotta/bufexplorer'
" f -> two character f
Plug 'justinmk/vim-sneak'
" syntax checking
Plug 'scrooloose/syntastic'
" super tab for making YCM and ultisnips work together
Plug 'ervandew/supertab'
if !has('win32')
  " Autocompletion / goto definition / etc.
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
endif
" Installing this mainly because YouCompleteMe seems to assume its there..
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" The Silver Searcher (grep/ack replacement)
Plug 'rking/ag.vim'
" Convenient mappings for common unixy commands
Plug 'tpope/vim-eunuch'
" Color matching parens,braces,etc. with matching colors for better readability
Plug 'luochen1990/rainbow'
" Make editing Latex documents nicer
Plug 'LaTeX-Box-Team/LaTeX-Box'
" Comment text using 'gc'
Plug 'tpope/vim-commentary'
" git status in the sign column
Plug 'airblade/vim-gitgutter'
" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" Auto-close quotes, parentheses, brackets
Plug 'Raimondi/delimitMate'

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
"colorscheme onedark     " sets the colorscheme
"colorscheme solarized
colorscheme zenburn
set background=dark     " enable for dark terminals
set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set undofile            " stores undo state even when files are closed (in undodir)
set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu

" autocomplete options
set wildmode=longest:full
set wildmenu  " completion with menu

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab

" EDITOR SETTINGS
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
set nu                     " turn on line numbers
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
highlight Comment cterm=italic


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

" this maximizes the gvim window on startup


" Sets a font for the GUI
set guifont=SourceCodePro\ 14

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
noremap <leader>w :w<CR>

" fast quit
noremap <leader>q :q<CR>

" <Leader>cd changes directory to location of current file
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" <Leader>z switches to previous buffer
noremap <leader>z :e#<CR>

" <leader>v brings up .vimrc
noremap <leader>v :e $MYVIMRC<CR>

" for faster scrolling
nnoremap J 15gj
nnoremap K 15gk

" since we removed J default binding, remap line join to <leader>j
nnoremap <leader>j J
" likewise for K
nnoremap <leader>k K

" These create newlines like o and O but stay in normal mode
noremap <leader>o o<Esc>k
noremap <leader>O O<Esc>j

" shortcut for make
noremap <leader>m :make!<CR>

nnoremap Y y$            " Y yanks to end of line

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

" Alt to exit insert mode
inoremap <M-h> <ESC>h
inoremap <M-j> <ESC>j
inoremap <M-k> <ESC>k
inoremap <M-l> <ESC>l

" Use Escape to exit terminal mode (neovim only)
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" simplify moving between windows
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

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
"                       ***  BUFEXPLORER  ***                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <Leader>b loads bufexplorer
noremap <silent> <leader>b :BufExplorer<CR>
" disable default mappings so vim doesn't wait to see if <Leader>b[x] is going to be pressed
let g:bufExplorerDisableDefaultKeyMapping=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  CTRLP  ***                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fuzzy file searching via ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" <Leader>p shortcut
nnoremap <leader>p <C-p>
" use nearest ancestor containing .git file, or cwd
let g:ctrlp_working_path_mode = 'ra'

" use the silver searcher if available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore BoostParts
      \ -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  DELIMIT MATE  ***                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType html,xhtml,markdown let b:delimitMate_matchpairs = "(:),[:],{:}"

" highlight and jump between matching angle brackets.
" This is useful for heavily templated C++
au FileType c,cpp let b:delimitMate_matchpairs = "<:>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ***  MUNDO  ***                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" persist undo information
set undofile
set undodir=~/.vim/undo

" mapping for Mundo plugin
nnoremap <leader>u :MundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  RAINBOW  ***                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_active=1                  " on by default
nnoremap <leader>r :RainbowToggle<CR>   " toggle with <leader>r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  SYNTASTIC  ***                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" automatically populate vim's location list with errors
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" uncomment below to use 4 space indents in python, instead of 2
"autocmd FileType python setlocal shiftwidth=4 tabstop=4

" use the pylint and pep8 checkers for python code
let g:syntastic_python_checkers = ['flake8']
" ignore pep8 warnings:
" E111: indents not a multiple of four
" E114: indents not a multiple of four (for a comment)
" E501: lines over 80 characters
" E201: whitespace after '('
" E202: whitespace before ')'
" E221: missing whitespace around operator
" E225: missing whitespace around operator
" E226: missing whitespace around operator
" E227: missing whitespace around operator
" E228: missing whitespace around operator
" E231: msising whitespace after ','
" W391: blank lines at eof
"let g:syntastic_python_flake8_post_args = '--ignore=E501,E201,E202,E221,E225,E226,E227,E228,E231,W391'
let g:syntastic_python_flake8_post_args = '--ignore=E111,E114,E501,E201,E202,W391'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          ***  ULTISNIPS  ***                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" we can't use <tab> as our snippet key since we use that with YouCompleteMe
let g:UltiSnipsSnippetsDir         = $HOME . '/vim-config/vim/UltiSnips'
let g:UltiSnipsListSnippets        = "<c-m-s>"
let g:UltiSnipsJumpForwardTrigger  = "<right>"
let g:UltiSnipsJumpBackwardTrigger = "<left>"
let g:snips_author                 = 'Strahinja Val Markovic'

" Generate SPHINX-style (numpy-style) documents in snippets
let g:ultisnips_python_style = "sphinx"

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
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


nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>  " goto definition
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>               " compile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ***  VIM-AIRLINE  ***                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" powerline fonts only working on mac
if has('mac')
  let g:airline_powerline_fonts = 1
else
  let g:airline_powerline_fonts = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  VIM-SNEAK  ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" these are the defaults. you can change them if you like the current 's' map
"nmap s <Plug>Sneak_s
"nmap S <Plug>Sneak_S

" Replce f and t with 1-character sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" label mode - minimalist easymotion
let g:sneak#label = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***    ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
