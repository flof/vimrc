" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/vimfiles/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'sbdchd/neoformat'
Plug 'lifepillar/vim-solarized8'

" Initialize plugin system
call plug#end()

set ai                  " auto indenting
set history=1000        " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
filetype indent on
set smartindent
set cindent
set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmode=list:longest
set visualbell
set ttyfast
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
let g:closetag_html_style=1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.xml'
source ~/vimfiles/scripts/closetag.vim 
set guifont=Consolas:h10:cANSI
set lines=50 columns=120
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

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if (has("termguicolors"))
	set termguicolors
endif

colorscheme wombat256
source $VIMRUNTIME/mswin.vim
behave mswin

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

com! PrettyJSON %!python -m json.tool

let g:pencil#wrapModeDefault = 'hard'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
augroup END
let g:jsx_ext_required = 0

" Call neoformat for formatting js code with prettier
autocmd BufWritePre *.js Neoformat

