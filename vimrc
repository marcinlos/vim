
" Disable vi compatibility
set nocompatible

" Use utf-8 as the internal encoding
set encoding=utf-8

" Set leader and local leader
let mapleader      = "\<Space>"
let maplocalleader = "\<BS>"

" Enable mouse
set mouse=a

"### Plugin management
" {

" Download vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugin manager
Plug 'junegunn/vim-plug'

" Directory explorer
Plug 'scrooloose/nerdtree'

" Syntax checkers for many a language
Plug 'scrooloose/syntastic'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing enhancements
Plug 'tpope/vim-surround'      " surround object with delimiters
Plug 'tpope/vim-repeat'        " better dot
Plug 'tpope/vim-commentary'    " comment/uncomment region
Plug 'tpope/vim-unimpaired'    " [/]-based location and option switches
Plug 'tpope/vim-endwise'       " insert matching structure endings
Plug 'tpope/vim-abolish'       " smart substitutions and case conversion

" Regexp-based aligning
Plug 'godlygeek/tabular'

" Better incremental search
Plug 'haya14busa/incsearch.vim'

" Fuzzy search for everything
Plug 'Shougo/vimproc.vim', {'do': 'make' }
Plug 'Shougo/unite.vim'

" Syntax
Plug 'tpope/vim-git'
Plug 'neovimhaskell/haskell-vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Color scheme
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

" Status line
Plug 'bling/vim-airline'

" Autocomplete for Python/C++/...
" Needs to be compiled!
" Plug 'ycm-core/YouCompleteMe'

call plug#end()
" }

syntax on


"### Display settings

set background=dark

" Disable some UI elements in gVim
if has('gui_running')
    set guifont=Consolas\ 10
    set guioptions-=m      " no menu bar
    set guioptions-=T      " no toolbar
    set guioptions-=r      " no right scrollbar
    set guioptions-=L      " no left scrollbar, ever
endif

" Color scheme settings
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_guisp_fallback = 'fg'   " mark errors by changing fg color
colorscheme gruvbox

" Highlight the line of the cursor
set cursorline

" airline settings
" {

set laststatus=2      " show status line for all windows
set noshowmode        " don't display mode in bottom line

" improved buffer and tab display
let g:airline#extensions#tabline#enabled = 1

" Don't show the full path unless necessary
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" don't show the buffer list if there's only one
let g:airline#extensions#tabline#buffer_min_count = 2

" don't show the close button in buffer/tab list
let g:airline#extensions#tabline#show_close_button = 0

" Use Powerline fonts by default (disable if not available)
let g:airline_powerline_fonts = 1

" }

" No redraw during macros
set lazyredraw

" Enable :Man command
runtime! ftplugin/man.vim


"### General settings

set history=1000      " increase size of command history
set showcmd           " display pressed keys

set tabstop=4         " how many spaces is tab equivalent to
set shiftwidth=4      " number of spaces per indent level
set shiftround        " round indent to multiple of shiftwidth
set expandtab         " insert spaces instead of tab
set smarttab          " insert/delete shiftwidth spaces at line start
set autoindent        " copy indent from previous line

set formatoptions+=j  " remove comment start when joining lines

set textwidth=100     " maximal line length
set number            " display line numbers

set splitright        " new windows created to the right
set splitbelow        " new windows created below

set virtualedit=block " allow arbitrary cursor position in visual block mode

" Display cmd line completions using wildmenu
set wildmenu
set wildmode=longest:full,full  " complete longest prefix, show wildmenu

" Ignored patterns
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.o   " object files
set wildignore+=*.mod " Fortran module files
set wildignore+=*.pyc " Python bytecode
set wildignore+=*.jar " Java JARs

set path+=**          " recursive search for :edit

" Patterns are case-insensitive, unless they contain capital letters
set ignorecase
set smartcase

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showbreak=…       " explicitly show long wrapped lines
set linebreak         " only break lines at specified characters
set scrolloff=4       " keep some space when cursor is near top/bottom
set display+=lastline " display as much of the last line as possible

" Characters displayed by :list
set listchars=tab:➟\ ,eol:⤦,trail:·

set complete-=i       " don't use includes to complete
set nrformats-=o      " don't recognize octal numbers

" Allow slow terminals interpret key codes correctly
set ttimeout
set ttimeoutlen=100

set autoread          " automatically update buffers changed outside Vim
set updatetime=500    " write swap file if nothing is typed for 500 ms
set hidden            " don't unload abandoned buffers

set matchpairs+=<:>   " highlight matching < and >

" Persistent undo
set undofile
set undodir=~/.vim/undo

set nofoldenable      " start with open folds
set foldmethod=syntax " create folds automatically based on indentation

" Enable globstar for recursive file matching in grep etc.
if &shell =~# 'bash'
    set shell+=\ -O\ globstar
endif

" Load plugin enabling % to jump to matching tags, ifs etc
if findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

"### Generic bindings

" Easily save file
nnoremap <silent>   <Leader><Leader>   :update<CR>

" Moving between buffers
nnoremap <silent>   <C-k>      :bnext<CR>
nnoremap <silent>   <C-j>      :bprevious<CR>

" Moving between tabs
nnoremap <silent>   <C-n>      :tabnext<CR>
nnoremap <silent>   <C-p>      :tabprevious<CR>

" Indent in visual mode without losing selection
xnoremap <   <gv
xnoremap >   >gv

" Unindent in insert mode using S-Tab
inoremap <S-Tab>    <C-d>

" Allow undo for deletions using Ctrl-w/u in insert mode
" (<C-g>u breaks undo sequence)
inoremap <C-w>      <C-g>u<C-w>
inoremap <C-u>      <C-g>u<C-u>

" Use Ctrl-n/p to drill into subdirectories when opening file
cnoremap <C-n>      <Down>
cnoremap <C-p>      <Up>
let &wildcharm = &wildchar   " workaround, Ctrl-n doesn't work w/o this

" Disable Ex mode, format instead
map Q gq

" Make Y behaviour consistent with the rest of vim
map Y y$

" Clear trailing whitespace
command! -range=% CleanTrailingSpaces keeppatterns <line1>,<line2>s/\s\+$//e
noremap <silent>  <Leader>w  :CleanTrailingSpaces<CR>


let g:UltiSnipsExpandTrigger="<C-j>"


"### Plugin configuration

"# NERDTree

noremap <silent>  <F2>  :NERDTreeToggle<CR>

" Cleaner UI
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" Don't show compilation producst
let g:NERDTreeIgnore = ['\.o$', '\.mod$', '\.pyc$']


"# Syntastic

" Disable automatic checking on save
let g:syntastic_mode_map = { 'mode': 'passive' }

" Automatically load the list of errors into location window and open it
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Don't aggregate errors from multiple sources
let g:syntastic_aggregate_errors = 1

" Use python3 checker
let g:syntastic_python_python_exec = 'python3'

" Better symbol for error signs
let s:error_sign   = "✘"   " \u2716
let s:warning_sign = "△"   " \u2714 (alternatives: ✔ ⚠️ )
let g:syntastic_error_symbol         = s:error_sign
let g:syntastic_warning_symbol       = s:warning_sign
let g:syntastic_style_error_symbol   = s:error_sign
let g:syntastic_style_warning_symbol = s:warning_sign

" Color scheme for error signs
hi! link SyntasticErrorSign         GruvboxRedSign
hi! link SyntasticWarningSign       GruvboxYellowSign
hi! link SyntasticStyleErrorSign    GruvboxAquaSign
hi! link SyntasticStyleWarningSign  GruvboxAquaSign

" Mappings
noremap <silent>  <Leader>cc  :SyntasticCheck<CR>
noremap <silent>  <Leader>cl  :Errors<CR>
noremap <silent>  <Leader>cr  :SyntasticReset<CR>
noremap <silent>  <Leader>ct  :SyntasticToggle<CR>


"# fugitive
nnoremap           <Leader>v<Space>  :Git<Space>
nnoremap <silent>  <Leader>vv        :Git<CR>
nnoremap <silent>  <Leader>vb        :Git blame<CR>


"# git-gutter

" Disable by default
let g:gitgutter_enabled = 0

" Per buffer toggle
nnoremap <silent>  <Leader>hh        :GitGutterToggle<CR>


"# Tabularize
nnoremap <silent>  <Leader>a<Space>  :Tabularize spaces<CR>
xnoremap <silent>  <Leader>a<Space>  :Tabularize spaces<CR>

nnoremap <silent>  <Leader>a,        :Tabularize /,<CR>
xnoremap <silent>  <Leader>a,        :Tabularize /,<CR>

nnoremap <silent>  <Leader>a=        :Tabularize assignment<CR>
xnoremap <silent>  <Leader>a=        :Tabularize assignment<CR>

nnoremap <silent>  <Leader>a<<       :Tabularize cpp_io<CR>
xnoremap <silent>  <Leader>a<<       :Tabularize cpp_io<CR>

nnoremap <silent>  <Leader>a&        :Tabularize /&<CR>
xnoremap <silent>  <Leader>a&        :Tabularize /&<CR>


"# incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" automatically turn off hlsearch after cursor move
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


"# Unite

" Use default matcher (use 'matcher_fuzzy' for fuzzy matcher)
call unite#filters#matcher_default#use(['matcher_context'])

" Sort matches by accuracy
call unite#filters#sorter_default#use(['sorter_rank'])

" Default search window settings:
" - start inserting narrowing text immediately
" - place the search window on the bottom
" - place the prompt on top of search window
" - use custom prompt
" - use smartcase in search
call unite#custom#profile('default', 'context', {
\   'start_insert'     : 1,
\   'direction'        : 'botright',
\   'prompt_direction' : 'top',
\   'prompt'           : '➤ ',
\   'smartcase'        : 1,
\ })

" Use ag if available
if executable('ag')
    " file_rec/async
    let g:unite_source_rec_async_command =
    \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

    " grep
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden ' .
    \ '--ignore ''.git'' --ignore ''.svn'' --ignore ''.hg'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

" Mappings

" Find file (recursive)
nnoremap <silent> <Leader>f  :<C-u>Unite
            \ -buffer-name=files
            \ -resume
            \ -no-restore
            \ -input=
            \ file_rec/async:!<CR>

" Find file in project
nnoremap <silent> <Leader>pf :<C-u>Unite
            \ -buffer-name=git-files
            \ -resume
            \ -no-restore
            \ -input=
            \ file_rec/git<CR>

" Grep all files
nnoremap <silent> <Leader>g  :<C-u>Unite
            \ -buffer-name=grep
            \ -no-start-insert
            \ grep<CR>

" Grep project files
nnoremap <silent> <Leader>pg :<C-u>Unite
            \ -buffer-name=grep
            \ -no-start-insert
            \ grep/git::-i<CR>

" Resume previous grep search
nnoremap <silent> <Leader>G  :<C-u>UniteResume grep<CR>

" Select buffer
nnoremap <silent> <Leader>b  :<C-u>Unite
            \ -buffer-name=buffers
            \ -no-start-insert
            \ buffer<CR>

" Search for lines in current buffer
nnoremap <silent> <Leader>l  :<C-u>Unite
            \ -buffer-name=lines
            \ line<CR>

" Bring back last Unite buffer
nnoremap <silent> <Leader>r  :<C-u>UniteResume -restore<CR>


"# gutentags
let g:gutentags_cache_dir = '~/.cache/tags'


"### Filetype-specific settings

augroup CustomFileTypeSettings
    autocmd!

    " If no omnifunc is present, use one based on syntax highlighting rules
    autocmd FileType *
        \ if &omnifunc == '' |
        \    setlocal omnifunc=syntaxcomplete#Complete |
        \ endif

    " Use tab of size 2 in some languages
    autocmd FileType tex, fortran, haskell setlocal tabstop=2 shiftwidth=2

    " Line length limit for git commit messages body
    autocmd FileType gitcommit setlocal spell textwidth=72

    " Use python3 completion
    autocmd FileType python  setlocal omnifunc=python3complete#Complete

augroup END

