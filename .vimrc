execute pathogen#infect()
set ai                  " auto indenting
set history=1000        " keep 100 lines of history
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
filetype indent on
syntax on               " syntax highlighting
set smartindent
set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=110
let g:closetag_html_style=1
source ~/.vim/scripts/closetag.vim 
"set guifont=Office\ Code\ Pro\ D\ 10
set guifont=Terminus\ 12
if has("gui_running")
	set lines=60 columns=120
endif
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:vim_markdown_folding_disabled=1
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
colorscheme wombat256

"source $VIMRUNTIME/mswin.vim
"behave mswin

"Map jk to ESC 
inoremap jk <ESC>

"Map leader to space
nnoremap <SPACE> <Nop>
let mapleader = " "

"Run current buffer with node (and save it before)
nnoremap <leader>rn :w<CR> :!node %<CR>

"The following line makes webpack watch-mode more reliable
:set backupcopy=yes
