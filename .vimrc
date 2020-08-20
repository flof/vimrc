" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'kien/ctrlp.vim'
Plug 'plasticboy/vim-markdown'
Plug 'lifepillar/vim-solarized8'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sleuth'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()

set ai                  " auto indenting
set hlsearch            " highlight the last searched term
set nocompatible
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmode=list:longest
set visualbell
set ttyfast
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set guifont=InputMonoCondensed\ Regular\ 12

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }

colorscheme wombat256
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

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

if (has("termguicolors"))
	set termguicolors
endif

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

set undodir=~/.vim/tmp
set wildignore+=node_modules/**,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak
set suffixes+=.class

" Map CTRL-L to switch to prev buffer in case CTRL-^ and CTRL-6 don't work
nmap <C-l> :b#<CR>
nnoremap ü ]
nnoremap Ü [

