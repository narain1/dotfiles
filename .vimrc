set background=dark

set nocompatible
filetype off

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'tmhedberg/SimpylFold'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set ttyfast
set mouse=a
set t_Co=256
set pythonthreedll="c:\Users\narain\Python38-32\python3.dll"

set foldcolumn=3

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" The bundles you install will be listed here
Plugin 'w0rp/ale'

call ale#Set('python_black_executable', 'black')
call ale#Set('python_black_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('python_black_options', '')
call ale#Set('python_black_auto_pipenv', 0)
call ale#Set('python_black_change_directory', 1)

function! ale#fixers#black#GetExecutable(buffer) abort
    if (ale#Var(a:buffer, 'python_auto_pipenv') || ale#Var(a:buffer, 'python_black_auto_pipenv'))
    \ && ale#python#PipenvPresent(a:buffer)
        return 'pipenv'
    endif

    return ale#python#FindExecutable(a:buffer, 'python_black', ['black'])
endfunction

function! ale#fixers#black#Fix(buffer) abort
    let l:cd_string = ale#Var(a:buffer, 'python_black_change_directory')
    \   ? ale#path#BufferCdString(a:buffer)
    \   : ''

    let l:executable = ale#fixers#black#GetExecutable(a:buffer)

    let l:exec_args = l:executable =~? 'pipenv$'
    \   ? ' run black'
    \   : ''

    let l:options = ale#Var(a:buffer, 'python_black_options')

    if expand('#' . a:buffer . ':e') is? 'pyi'
        let l:options .= '--pyi'
    endif

    return {
    \   'command': l:cd_string . ale#Escape(l:executable) . l:exec_args
    \       . (!empty(l:options) ? ' ' . l:options : '')
    \       . ' -',
    \}
endfunction

let g:SimpylFold_docstring_preview=1

"Plugin 'janko-m/vim-test'
"nmap <silent> <leader>t :TestNearest<CR>
"nmap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>

Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Konfekt/FastFold'

Plugin 'vim-airline/vim-airline'

call vundle#end()            " required
filetype plugin indent on

let python_highlight_all=1
syntax on
set encoding=utf-8

set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.

set pastetoggle=<F10>
set expandtab

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.cpp set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.c set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.h set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.hpp set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
setlocal foldmethod=expr

au BufNewFile,BufRead *.js,*.html,*.css: set tabstop=2 softtabstop=2 shiftwidth=2
set list
set listchars=tab:>-

let mapleader = "\\"
map <Leader>ve :sp $HOME/.vimrc<CR>
map <Leader>vs :source $HOME/.vimrc<CR>

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

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>
