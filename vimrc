
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
Plugin 'tpope/vim-commentary' 
Plugin 'godlygeek/tabular'

if v:version >= 702
    Plugin 'Shougo/unite.vim'
endif

"Plugin 'jlanzarotta/bufexplorer' 
"Plugin 'wincent/command-t' 

" Tags
Plugin 'xolox/vim-misc' 
Plugin 'xolox/vim-easytags' 

" Color scheme
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'


Plugin 'Valloric/YouCompleteMe'

Plugin 'idris-hackers/idris-vim'

" Haskell plugins
"Plugin 'bitc/vim-hdevtools'
"vimproc is needed by ghcmod-vim
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'dag/vim2hs'

call vundle#end()
filetype plugin indent on

set encoding=utf-8

syntax on

" Color scheme settings
set t_Co=256
colorscheme molokai
"colorscheme gruvbox
"let g:gruvbox_italic=0


set tabstop=4
set shiftwidth=4
set expandtab
set number

set splitright
set splitbelow
set virtualedit=block
set wildmenu
"set wildmode=longest:full,full

set textwidth=100
set background=dark

set wildignore+=*.o,*.mod,*.pyc

" Generic bindings
let mapleader=" "

set showbreak=…
set linebreak
set scrolloff=4

set listchars=tab:➟\ ,eol:⤦,trail:·
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <C-n> :tabprevious<CR>
nmap <silent> <C-m> :tabnext<CR>


" NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$', '\.mod$', '\.pyc$']

" Line length limit for git commit messages body
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd FileType tex setlocal ts=2 sw=2
autocmd FileType fortran setlocal ts=2 sw=2

" Haskell
autocmd FileType haskell setlocal ts=2 sw=2
autocmd FileType haskell map <silent> <F3> :HdevtoolsType<CR>
autocmd FileType haskell map <silent> <F4> :HdevtoolsClear<CR>
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:haskell_conceal = 0

