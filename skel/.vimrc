"vim-plug section
call plug#begin('~/.vim/plugged')

"Essential
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Languages
Plug 'yuezk/vim-js'
Plug 'bfrg/vim-cpp-modern'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Initialize plugin system
call plug#end()

" Initialize glaive
call glaive#Install()

"NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

"Basic settings
syntax on
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
set mouse=a

"Line numbering
set number
set relativenumber

"Case insensitive search
set ignorecase
set smartcase
set incsearch

"Disable startup message
set shortmess+=I

"Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

"Search highlighting
set hlsearch
"Press space to unhighlight current search
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Theme
color industry
