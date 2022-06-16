let mapleader = "\<Space>"

nnoremap f :F<CR>

let g:fff#split_direction = "nosplitbelow nosplitright"

set background=dark
colorscheme ir_black
syntax on
set number
call plug#begin('~/.config/nvim/plugged/')

Plug 'vimwiki/vimwiki'
Plug 'dylanaraps/fff.vim'
Plug 'ap/vim-css-color'

" Initialize plugin system
call plug#end()
