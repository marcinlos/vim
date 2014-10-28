
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
Plugin 'haya14busa/incsearch.vim'

if v:version >= 702
    Plugin 'Shougo/unite.vim'
    Plugin 'bling/vim-airline'
endif

"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'wincent/command-t'


Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" Color scheme
"Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'


Plugin 'Valloric/YouCompleteMe'

"Plugin 'idris-hackers/idris-vim'

" Haskell plugins
"Plugin 'bitc/vim-hdevtools'
"vimproc is needed by ghcmod-vim
"Plugin 'Shougo/vimproc.vim'
"Plugin 'eagletmt/ghcmod-vim'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'dag/vim2hs'

call vundle#end()
filetype plugin indent on

set encoding=utf-8

syntax on

" Display settings
set background=dark

if has('gui_running')
    set guifont=Consolas\ 10
else
    set t_Co=256
endif

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
set cursorline
"colorscheme gruvbox
"let g:gruvbox_italic=0

if v:version >= 702
    let g:airline_theme = 'my_molokai'
    "let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    set laststatus=2
    set noshowmode
endif



" General settings
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

set wildignore+=*.o,*.mod,*.pyc

" Generic bindings
let mapleader=" "

set showbreak=…
set linebreak
set scrolloff=4

set listchars=tab:➟\ ,eol:⤦,trail:·
nmap <silent> <leader>l :set list!<CR>
nnoremap <silent> <C-k> :tabnext<CR>
nnoremap <silent> <C-j> :tabprevious<CR>
nmap <silent> <leader>s :set spell!<CR>

let g:UltiSnipsExpandTrigger="<C-j>"


" NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$', '\.mod$', '\.pyc$']

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

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

