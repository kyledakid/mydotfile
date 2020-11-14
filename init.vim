call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

syntax on
filetype plugin indent on
set t_Co=256
set clipboard+=unnamedplus
set nu
set ruler
set shiftwidth=2
set softtabstop=2
set expandtab

" Plugins configs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

" Map Keys
let mapleader = ","
noremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>ga :G add --all<CR>
nnoremap <leader>gc :G commit -a<CR>
nnoremap <leader>gp :Gpush<CR>
autocmd FileType go nmap <leader>r :w<CR>:vsplit <bar> terminal go run %<CR>

