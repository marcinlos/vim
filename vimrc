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

"Pathogen
"execute pathogen#infect()
"execute pathogen#helptags()

set encoding=utf-8

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"Enable syntax highlighting
syntax on

set tabstop=4
set expandtab
set number
set shiftwidth=4
set background=dark
set textwidth=100

set listchars=tab:➟\ ,eol:⤦,trail:·
map <leader>l :set list!
map <silent> <F2> :NERDTreeToggle

nnoremap Q gq}

autocmd FileType text setl updatetime=1000
autocmd FileType tex setl ts=2 sw=2
autocmd FileType fortran setl ts=2 sw=2
autocmd FileType haskell setl ts=2 sw=2
autocmd FileType haskell map <silent> <F3> :HdevtoolsType
autocmd FileType haskell map <silent> <F4> :HdevtoolsClear
