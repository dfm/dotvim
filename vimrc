set nocompatible
let mapleader=","
command! W :w

"
" A little bit of mumbo jumbo from
" Steve Losh's Learn Vimscript the Hard Way
" =========================================
"

" Edit and source .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move a line up/down in a file
nnoremap - ddp
nnoremap _ ddkkp

" Surround a word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hviwo<esc>i"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hviwo<esc>i'<esc>lel

" A better mapping for leaving insert mode
inoremap jk <esc>
inoremap <esc> <nop>

" Train my muscles to forget arrow keys!
noremap <Left>  <nop>
noremap <Right> <nop>
noremap <Up>    <nop>
noremap <Down>  <nop>

" Save current file by double clicking leader
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <esc>:w<cr>

"
" Plugins
" =======
"

" Load the Gundo window
map <leader>g :GundoToggle<CR>

"
" Python stuff
" ============
"


