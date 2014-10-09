
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'bitc/vim-hdevtools'

call vundle#end()
filetype plugin indent on

set encoding=utf-8

syntax on

set tabstop=4
set expandtab
set number
set shiftwidth=4

set splitright
set splitbelow

set textwidth=100
set background=dark

set listchars=tab:➟\ ,eol:⤦,trail:·
map <leader>l :set list!
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

map <silent> <F2> :NERDTreeToggle

nnoremap Q gq}

autocmd FileType text setl updatetime=1000
autocmd FileType tex setl ts=2 sw=2
autocmd FileType fortran setl ts=2 sw=2
autocmd FileType haskell setl ts=2 sw=2
autocmd FileType haskell map <silent> <F3> :HdevtoolsType
autocmd FileType haskell map <silent> <F4> :HdevtoolsClear

let NERDTreeIgnore = ['\.o$', '\.mod$']
