call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dikiaap/minimalist'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

syntax on
set t_Co=256
colorscheme minimalist
set nu
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
