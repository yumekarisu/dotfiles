let mapleader = "\<Space>"

nnoremap f :F<CR>

let g:fff#split_direction = "nosplitbelow nosplitright"

set termguicolors
set background=dark
colorscheme carbonized-dark
syntax on
set number

call plug#begin('~/.config/nvim/plugged/')

Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'rlue/vim-barbaric'
Plug 'preservim/nerdtree'
Plug 'haystackandroid/carbonized'

" Initialize plugin system
call plug#end()
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
