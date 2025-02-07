let mapleader = " "
set number
set tabstop=4
set mouse=a
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap


set relativenumber
set clipboard=unnamedplus
let g:clipboard = {
      \   'name': 'macOS-clipboard',
      \   'copy': {
      \      '+': 'pbcopy',
      \      '*': 'pbcopy',
      \    },
      \   'paste': {
      \      '+': 'pbpaste',
      \      '*': 'pbpaste',
      \   },
      \   'cache_enabled': 0,
      \ }

set nocursorcolumn
set hlsearch
set incsearch
set ignorecase
set smartcase

set undofile
set undodir=~/vim/undodir
set timeoutlen=500
syntax on


" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Add plugins here
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'ap/vim-buftabline'
Plug 'vim-python/python-syntax'
call plug#end()


let g:python_highlight_errors = 0
" Use <Tab> and <Shift-Tab> to cycle completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <Enter> to confirm completion
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Function to check if backspace should be treated normally
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

colorscheme gruvbox

set termguicolors
set guicursor=n-v-c:block-Cursor/lCursor


set breakindent
set showbreak=↳\


highlight MatchParen ctermbg=NONE term=bold guibg=NONE gui=bold

highlight Cursor cterm=underline guibg=NONE

highlight CursorLine guibg=Gray ctermbg=Gray

" Save
nnoremap <leader>w :w<CR>
" quit
nnoremap <leader>q :q<CR>
" yank"
nnoremap <leader>y "+y
xnoremap y "+y
" paste
nnoremap p "+p
" clear search 
nnoremap <leader>/ :nohlsearch<CR>

" toggle nerd
nnoremap <leader>e :NERDTreeToggle<CR>
" close it
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif
" switch between windows
nnoremap <leader>a <C-w>w 
" tab nav
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>c :bd<CR>

nnoremap <leader>t :botright 12split +terminal<CR>

set showtabline=2
let g:buftabline_numbers = 2

tnoremap <leader>a <C-w>w 
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>c :bd<CR>
