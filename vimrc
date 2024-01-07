
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
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" Syntax checkers for many a language
Plug 'scrooloose/syntastic', {'on': ['SyntasticCheck', 'SyntasticToggle']}

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" Editing enhancements
Plug 'tpope/vim-surround'      " surround object with delimiters
Plug 'tpope/vim-repeat'        " better dot
Plug 'tpope/vim-commentary'    " comment/uncomment region
Plug 'tpope/vim-unimpaired'    " [/]-based location and option switches
Plug 'tpope/vim-endwise'       " insert matching structure endings
Plug 'tpope/vim-abolish'       " smart substitutions and case conversion

" Additional text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-fold'
Plug 'michaeljsmith/vim-indent-object'
" File management
Plug 'tpope/vim-eunuch'

" Regexp-based aligning
Plug 'godlygeek/tabular', {'on': 'Tabularize'}

" Better incremental search
Plug 'haya14busa/incsearch.vim'

" Jump to target
Plug 'easymotion/vim-easymotion'

" Fuzzy search
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Alternate files navigation
Plug 'tpope/vim-projectionist'

" Syntax
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'neovimhaskell/haskell-vim'
Plug 'tmux-plugins/vim-tmux'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tags
if executable('ctags') && has('job')
    Plug 'ludovicchabant/vim-gutentags'
endif

" Color scheme
Plug 'morhetz/gruvbox'

" Status line
Plug 'bling/vim-airline'

" Autocomplete for Python/C++/...
" Needs to be compiled!
" Plug 'ycm-core/YouCompleteMe'

call plug#end()
" }

" Auxiliary function to make setting paths easier
function! MakeDirInDotVim(name)
    let path = glob('~/.vim/') . a:name
    if !isdirectory(path)
        call mkdir(path, 'p')
    endif
    return path
endfunction

"### Display settings

set background=dark

" Disable some UI elements in gVim
if has('gui_running')
    let &guifont = 'Hack Nerd Font Mono 10'
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

" Disable integration with Syntastic to allow lazy loading it
let g:airline#extensions#syntastic#enabled = 0

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

" Display cmd line completions using wildmenu
set wildmenu
set wildmode=longest:full,full  " complete longest prefix, show wildmenu

" Ignored patterns
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.o   " object files
set wildignore+=*.mod " Fortran module files
set wildignore+=*.pyc " Python bytecode
set wildignore+=*.jar " Java JARs

" Patterns are case-insensitive, unless they contain capital letters
set ignorecase
set smartcase

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showbreak=…       " explicitly show long wrapped lines
set linebreak         " only break lines at specified characters
set scrolloff=4       " keep some space when cursor is near top/bottom
set display+=lastline " display as much of the last line as possible

set visualbell        " no beeping on errors
set t_vb=             " no visual bell

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

set completeopt+=menuone  " show popup on completion even for one match

" Persistent undo
set undofile

" Store swap, backup and undo files out of sight
let &undodir = MakeDirInDotVim('undo')
let &backupdir = MakeDirInDotVim('backup')
let &directory = MakeDirInDotVim('swap')

" Put viminfo file inside .vim
set viminfo+=n~/.vim/.viminfo

set nofoldenable      " start with open folds
set foldmethod=indent " create folds automatically based on indentation

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

cnoremap %% <C-R>=fnameescape(expand('%:h')) . '/' <CR>

" Moving between buffers
nnoremap <silent>   <C-K>      :bnext<CR>
nnoremap <silent>   <C-J>      :bprevious<CR>

" Moving between tabs
nnoremap <silent>   <C-N>      :tabnext<CR>
nnoremap <silent>   <C-P>      :tabprevious<CR>

" Indent in visual mode without losing selection
xnoremap <   <gv
xnoremap >   >gv

" Unindent in insert mode using S-Tab
inoremap <S-Tab>    <C-D>

" Allow undo for deletions using C-W/U in insert mode
" (<C-G>u breaks undo sequence)
inoremap <C-W>      <C-G>u<C-W>
inoremap <C-U>      <C-G>u<C-U>

" Use C-N/P to drill into subdirectories when opening file
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
let &wildcharm = &wildchar   " workaround, C-N doesn't work w/o this

" Disable Ex mode, format instead
map Q gq

" Make Y behaviour consistent with the rest of vim
map Y y$

" Clear trailing whitespace
command! -range=% CleanTrailingSpaces keeppatterns <line1>,<line2>s/\s\+$//e
noremap <silent>  <Leader>w  :CleanTrailingSpaces<CR>

" Make C-L clear highlighting and update diff as well
nnoremap <silent>  <C-L>  :nohlsearch<Bar>diffupdate<CR><C-L>

let g:UltiSnipsExpandTrigger="<C-J>"


"### Plugin configuration

"# NERDTree

noremap <silent>  <F2>  :NERDTreeToggle<CR>

" Cleaner UI
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" Don't show compilation producst
let g:NERDTreeIgnore = ['\.o$', '\.mod$', '\.pyc$']

" Bookmark file location
let g:NERDTreeBookmarksFile = glob('~/.vim/.NERDTreeBookmarks')


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
noremap <silent>  <Leader>ct  :SyntasticToggleMode<CR>


"# fugitive
nnoremap           <Leader>v<Space>  :Git<Space>
nnoremap <silent>  <Leader>vv        :Git<CR>
nnoremap <silent>  <Leader>vb        :Git blame<CR>
nnoremap <silent>  <Leader>vl        :vertical :Git log<CR>


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


"# EasyMotion
let g:EasyMotion_smartcase = 1  " Use smartcase like in vanilla vim
let g:EasyMotion_use_upper = 1  " Display labels using uppercase
let g:EasyMotion_keys = 'ASDGHKLQWERTYUIOPZXCVBNMFJ;'

" default conflicts with <Leader><Leader> save file mapping
nmap <Leader>j <Plug>(easymotion-prefix)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
nmap <Leader>j. <Plug>(easymotion-repeat)

" two-character search
nmap <Leader>s <Plug>(easymotion-overwin-f2)


"# Fzf

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \ "git grep --column --line-number --no-heading --color=always ".shellescape(<q-args>), 1,
    \ {'options': '--delimiter : --nth 4..'},
    \ <bang>0)

" Find file
nnoremap <silent> <Leader>f  :<C-U>Files<CR>

" Find file in project
nnoremap <silent> <Leader>pf :<C-U>GFiles<CR>

" Grep all files
nnoremap <silent> <Leader>g  :<C-U>Ag<CR>

" Grep project files
nnoremap <silent> <Leader>pg :<C-U>GGrep<CR>

" Select buffer
nnoremap <silent> <Leader>b  :<C-U>Buffers<CR>

" Search for lines in current buffer
nnoremap <silent> <Leader>l  :<C-U>BLines<CR>

" Search for lines in all buffers
nnoremap <silent> <Leader>L  :<C-U>Lines<CR>

" Search for commits
nnoremap <silent> <Leader>vc :<C-U>Commits<CR>

" Search for help tags
nnoremap <silent> <Leader>H :<C-U>Helptags<CR>


"# markdown

" Enable syntax highlighting for python
let g:markdown_fenced_languages = ['python']


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
    autocmd FileType tex,fortran,haskell,cmake,yaml setlocal tabstop=2 shiftwidth=2

    " Line length limit for git commit messages body
    autocmd FileType gitcommit setlocal spell textwidth=72

    " Use python3 completion
    autocmd FileType python  setlocal omnifunc=python3complete#Complete

    " Automatically generated indents in gitconfig are tabs
    autocmd FileType gitconfig setlocal noexpandtab

    " Recognize .gp files as gnuplot scripts
    autocmd BufNewFile,BufRead *.gp setlocal filetype=gnuplot

augroup END

