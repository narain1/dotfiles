" General settings
set background=dark
set ignorecase
set smartcase
set encoding=utf-8
set ttyfast
set mouse=a
set t_Co=256
set foldcolumn=3
set shortmess-=S
set pastetoggle=<F10>
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab autoindent fileformat=unix
set fo-=t
set list
set listchars=tab:>-
set display+=lastline
set incsearch
set number relativenumber
set clipboard=unamedplus "sets the default copy register
syntax on

" Cursor appearance
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" File handling
set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.

" Vundle Configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-dispatch'
    Plugin 'tpope/vim-eunuch'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-fugitive'
    Plugin 'valloric/youcompleteme'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'nvie/vim-flake8'
    Plugin 'preservim/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'jeetsukumaran/vim-indentwise'
    Plugin 'vim-scripts/indentpython.vim'
call vundle#end()
filetype plugin indent on

" Python specific settings
au BufNewFile,BufRead *.py set shiftwidth=4 textwidth=119
setlocal foldmethod=syntax
let python_highlight_all=1

" Airline configuration
let g:airline#extensions#tabline#enabled = 1

" Key mappings
let mapleader = "\\"
map <Leader>ve :sp $HOME/.vimrc<CR>
map <Leader>vs :source $HOME/.vimrc<CR>
nnoremap <silent> <expr> <CR> Highlighting()
nnoremap <space> za
map g] :stj<CR>
map <Leader>= <C-W>=
map <Leader><CR> <C-W>_
map <Leader><Up> <C-W><Up><C-W>_
map <Leader><Down> <C-W><Down><C-W>_
map <Leader>1 99<C-W><Up><C-W>_
map <Leader>2 99<C-W><Up>1<C-W>j<C-W>_
map <Leader>3 99<C-W><Up>2<C-W>j<C-W>_
map <Leader>4 99<C-W><Up>3<C-W>j<C-W>_
map <Leader>5 99<C-W><Up>4<C-W>j<C-W>_
map <Leader>d Oimport pdb; pdb.set_trace()^[

" Highlight current word on Enter
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
load &rtp .= ',' . expand( '<sfile>:p:h' )
syn on
