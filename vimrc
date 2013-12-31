"Pathogen
execute pathogen#infect()

set encoding=utf-8

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


"Enable syntax highlighting
filetype off

filetype plugin indent on
syntax on

set tabstop=4
set expandtab
set number
set shiftwidth=4
set background=dark
set textwidth=100

set listchars=tab:➟\ ,eol:⤦,trail:·
map <leader>l :set list!

nnoremap Q gq}

autocmd FileType text setl updatetime=1000

autocmd FileType tex setl ts=2 sw=2

