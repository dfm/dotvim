"
" ==================
" * Basic Settings *
" ==================
"

set nocompatible
let mapleader=","

" fuck yeah!
command! W :w

syntax on
filetype on
filetype plugin indent on
set autoindent
set number
set numberwidth=1
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
set wildignore+=*.o,*.so
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.DS_Store?

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

" Un-highlight search when we hit enter
function! PressedEnter()
    :nohlsearch

    if &filetype == 'python'
        " Update PyFlakes if it's a Python file
        :PyflakesUpdate
    end
endfunction
autocmd BufRead,BufNewFile * nnoremap <buffer><cr> :call PressedEnter()<cr>

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

" Save current file by double clicking leader
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <esc>:w<cr>

"
" ===========
" * Plugins *
" ===========
"

call pathogen#infect()

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Solarized colorscheme
if has('gui_running')
    set background=light
    let g:solarized_termtrans=1
    colorscheme solarized
else
    set background=dark
endif

" TagList
nnoremap <leader>t :TlistToggle<CR>
set tags=./tags;/                       " configure Ctags to use global project tags
let Tlist_Use_Right_Window = 1          " only open taglist on the right
let Tlist_Exit_OnlyWindow = 1           " automatically close taglist when we close the window

"
" ==========
" * Python *
" ==========
"

let python_highlight_all = 1

augroup pythongroup
    autocmd!
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    " autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END


"
" ==================
" * Basic Settings *
" ==================
"

set nocompatible
let mapleader=","

" fuck yeah!
command! W :w

syntax on
if has('gui_running')
    set background=light
    let g:solarized_termtrans=1
    colorscheme solarized
else
    set background=dark
endif

filetype on
filetype plugin indent on
set autoindent
set number
set numberwidth=1
set title
set ruler
set virtualedit=block
set backspace=2             " Allow backspacing over autoindent, EOL, etc.
set showmatch               " Match parentheses
set matchpairs+=<:>         "   - also for angle bracket pairs
set nowrap
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
set statusline=%<%f\ (%y)

" Tab completion in command mode
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.so
set wildignore+=*.pyc
set wildignore+=*.sw?
set wildignore+=*.DS_Store?

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

" Un-highlight search when we hit enter
function! PressedEnter()
    :nohlsearch

    if &filetype == 'python'
        " Update PyFlakes if it's a Python file
        :PyflakesUpdate
    end
endfunction
autocmd BufRead,BufNewFile * nnoremap <buffer><cr> :call PressedEnter()<cr>

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

" Save current file by double clicking leader
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <esc>:w<cr>

"
" ===========
" * Plugins *
" ===========
"

call pathogen#infect()

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

"
" ==========
" * Python *
" ==========
"

let python_highlight_all = 1

augroup pythongroup
    autocmd!
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    " autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
augroup END

