" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

" git interface
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

" Python snytax checker
Plugin 'nvie/vim-flake8'

" Auto-completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
" Plugin 'ervandew/supertab'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Commenting
Plugin 'scrooloose/nerdcommenter'

" Surround
Plugin 'tpope/vim-surround'

" colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" latex
Plugin 'lervag/vimtex'

" tabularize
Plugin 'godlygeek/tabular'

call vundle#end()

" Display line numbers
set number
" au WinEnter * setlocal number
" au WinLeave * setlocal nonumber

" Highlight last column
set colorcolumn=80

set tabstop=4
set softtabstop=4
set shiftwidth=4

" Improve the display of warped lines
set showbreak=↪

" Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" au BufNewFile,BufRead *.js, *.html, *.css, *.tex, *.bib
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Options for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" Colorschemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Change background using F5 key
call togglebg#map("<F5>")

" Hide .pyc files in NERDTree list
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Always display the tabline, even if there is only one tab
set showtabline=4

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

" Search options
set incsearch
set hlsearch
" Search keyword blinks
" function! HLNext (blinktime)
"   let [bufnum, lnum, col, off] = getpos('.')
set ignorecase

" Highlight machting braces
set showmatch

" Easier navigation for split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new splits to the right and bottom
set splitbelow
set splitright

" 256 Colors
set t_Co=256
if &t_Co != 256 && ! has("gui_running")  
  echomsg ""
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  echomsg ""
  finish
endif

" Font encoding
set encoding=utf-8

" Higlight cursor line
set cursorline

" enable mouse because why not
if has('mouse')
  set mouse=a
endif

" Hide mouse pointer while typing
" set mousehide

" Disable updating display while executing the macros
set lazyredraw

" Don't show the current command in the lower right corner. In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
"set showcmd

" Latex indentation
let g:tex_flavor='latex'

" Line at the end of the column

" Re-map semicolon
nnoremap ; :
nnoremap : ;

" Use system clipboard
set clipboard=unnamed

" no swap files
set noswapfile
