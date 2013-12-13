filetype off
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'

syntax on
filetype plugin indent on
set autoindent

let mapleader=","

" fuck yeah!
command! W :w
command! Q :q

" No toolbar in the gui.
set guioptions-=T

set number
set numberwidth=3
highlight LineNr ctermbg=darkgrey

set title
set ruler
set virtualedit=block
set backspace=2             " Allow backspacing over autoindent, EOL, etc.
set showmatch               " Match parentheses
set matchpairs+=<:>         "   - also for angle bracket pairs
set nowrap
set foldlevel=99
set ww=<,>,[,],h,l,b,s,~

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround              " Rounds indent to multiple of shiftwidth

" Don't autosave anything
set noautowrite
set noautowriteall
set noswapfile
set nobackup
set nowb
set autoread                " Automatically read saved files

" Status line
set laststatus=2            " Always show it
set statusline=%<%f\ %y

" Tab completion in command mode
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.pdf
set wildignore+=*.dat
set wildignore+=*.o,*.so
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.DS_Store?
set wildignore+=venv
set wildignore+=*.fits,*.hdf5,*.h5

" Show invisibles
set listchars=tab:▸\ ,eol:¬
set list

" Color column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

" Searching
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Spell check
set spell
setlocal spell spelllang=en_us

" Un-highlight search when we hit enter
autocmd BufRead,BufNewFile * nnoremap <buffer><cr> :nohlsearch<cr>

" Clean up whitespace at the ends of lines before writing
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufNewFile,BufRead *.less set filetype=css

"
" =============================================
" * A little bit of mumbo jumbo from          *
" * Steve Losh's Learn Vimscript the Hard Way *
" =============================================
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

" jump to beginning/end of lines
noremap H ^
noremap L g_

" Save current file with ,.
nnoremap <leader>. :w<cr>
" Make with ,m
nnoremap <leader>m :make<cr>

" Window resizing
noremap <C-h> <C-w>>
noremap <C-j> <C-W>-
noremap <C-k> <C-W>+
noremap <C-l> <C-w><

" Yank, comment, paste.
nmap <leader>y Y\\\P
vmap <leader>y ygv\\P


"
" ===========================
" * Copy & Paste from Micha *
" ===========================
"

vmap <leader>c ! pbcopy<CR>u
nmap <leader>v :set paste<CR>! pbpaste<CR>:set nopaste<CR>


"
" ===========
" * Plugins *
" ===========
"

" Solarized colorscheme
" set background=dark
set background=light
if has("gui_macvim")
    set background=light
endif
let g:solarized_termtrans=1
colorscheme solarized
highlight Normal ctermbg=none

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"
" ==========
" * Python *
" ==========
"

let python_highlight_all = 1

augroup pythongroup
    autocmd!
    " autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set commentstring=#\ %s
    set foldmethod=indent
    au BufRead,BufNewFile *.py set tabstop=4
    au BufRead,BufNewFile *.py set shiftwidth=4
    au BufRead,BufNewFile *.py set softtabstop=4
augroup END

" Add the virtualenv's site-packages to vim path
" http://sontek.net/turning-vim-into-a-modern-python-ide
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"
" =========
" * LaTeX *
" =========
"

au BufRead,BufNewFile *.tex set wrap textwidth=78
au BufRead,BufNewFile *.tex set noai


" =================
" * Documentation *
" =================
"

au BufRead,BufNewFile *.md  set wrap textwidth=78
au BufRead,BufNewFile *.markdown  set wrap textwidth=78
au BufRead,BufNewFile *.rst  set wrap textwidth=78
au BufRead,BufNewFile *.md set filetype=markdown


" ==============
" * Javascript *
" ==============

au BufRead,BufNewFile *.js set tabstop=2
au BufRead,BufNewFile *.js set shiftwidth=2
au BufRead,BufNewFile *.js set softtabstop=2


" ===========
" * Fortran *
" ===========

au BufRead,BufNewFile *.f,*.f96,*.f90,*.f66,*.f77 set tabstop=2
au BufRead,BufNewFile *.f,*.f95,*.f90,*.f66,*.f77 set shiftwidth=2
au BufRead,BufNewFile *.f,*.f95,*.f90,*.f66,*.f77 set softtabstop=2
