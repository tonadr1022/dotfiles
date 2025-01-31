let mapleader = " "
set number
set relativenumber
set spell
set spelloptions=camel
set mouse=a
set showmode
set clipboard=unnamedplus
set nobreakindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set nobackup
" set undofile
" set undodir=~/.vim/undodir
set ignorecase
set smartcase
" set signcolumn=yes
set updatetime=50
set timeoutlen=200
set splitright
set splitbelow
set colorcolumn=120
set scrolloff=10
set nohlsearch
set incsearch
set termguicolors
let g:netrw_liststyle = 3
set isfname+=@-@
set pumheight=8
set cursorline
set cursorlineopt=number

 " Clear search highlight with Escape or Ctrl+c
 nnoremap <Esc> :nohlsearch<CR>
 nnoremap <C-c> :nohlsearch<CR>

 nnoremap <leader>; :

 nnoremap <C-d> <C-d>zz
 vnoremap <C-d> <C-d>zz

 nnoremap n nzzzv
 nnoremap N Nzzzv

 " Move visual selection
 vnoremap J :m '>+1<CR>gv=gv
 vnoremap K :m '<-2<CR>gv=gv
 " Better line joining
 nnoremap J mzJ`z

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
" Plug 'ghifarit53/tokyonight-vim'
call plug#end()
nnoremap <leader>e :NERDTreeToggle<CR>
" set termguicolors
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight

colorscheme desert
