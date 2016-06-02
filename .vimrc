execute pathogen#infect()
set ai                  " auto indenting
set history=1000        " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
filetype indent on
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
if $COLORTERM == 'xfce4-terminal'
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
set clipboard=unnamed

"The following line makes webpack watch-mode more reliable
:set backupcopy=yes

let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = '\v([\/]\.(git|hg|svn))|(node_modules)$'
let g:ctrlp_root_markers = ['.ctrlp']

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --encode UTF-8 --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

