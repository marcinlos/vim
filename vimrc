
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Shougo/unite.vim'
Plugin 'godlygeek/tabular'

Plugin 'Shougo/vimproc.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'idris-hackers/idris-vim'

"Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'dag/vim2hs'


call vundle#end()
filetype plugin indent on

set encoding=utf-8

syntax on

set tabstop=4
set shiftwidth=4
set expandtab
set number

set splitright
set splitbelow

set textwidth=100
set background=dark

" Generic bindings
set listchars=tab:➟\ ,eol:⤦,trail:·
map <leader>l :set list!<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

nnoremap Q gq}

" NERDTree
map <silent> <F2> :NERDTreeToggle
let NERDTreeIgnore = ['\.o$', '\.mod$', '\.pyc']

" Line length limit for git commit messages body
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd FileType tex setl ts=2 sw=2
autocmd FileType fortran setl ts=2 sw=2

" Haskell
autocmd FileType haskell setl ts=2 sw=2
autocmd FileType haskell map <silent> <F3> :HdevtoolsType
autocmd FileType haskell map <silent> <F4> :HdevtoolsClear
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:haskell_conceal = 0
