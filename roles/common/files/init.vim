" Inspired from https://github.com/kristijanhusak/neovim-config/blob/master/init.vim

" ================ dein config ===================
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/home/adam/.local/share/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/adam/.local/share/dein/')
  call dein#begin('/home/adam/.local/share/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/adam/.local/share/dein//repos/github.com/Shougo/dein.vim')

  " >>> Add or remove your plugins here <<<:
  ""
  call dein#add('Shougo/deoplete.nvim')	" auto-complete
  call dein#add('Shougo/denite.nvim') " fuzzy-searching across files using :Denite grep
  call dein#add('Shougo/neosnippet.vim') " Include code snippets
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')

  call dein#add('freeo/vim-kalisi') "colorscheme
  call dein#add('ryanoasis/vim-devicons') " icons everywhere!
  call dein#add('Raimondi/delimitMate') " Automatic closing of quotes, brackets, etc.

  call dein#add('vim-airline/vim-airline') " action bar
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('w0rp/ale') " Asynchronous linter

  call dein#add('tpope/vim-commentary') " Comment code easily
  call dein#add('tpope/vim-surround') " Surround with quotes, brackets
  call dein#add('tpope/vim-repeat') " Enable plugins to use repeat '.'
  call dein#add('tpope/vim-fugitive') " Git stuff

  call dein#add('scrooloose/nerdtree') " File browser

  call dein#add('airblade/vim-gitgutter') " Git diff viewer

  call dein#add('duff/vim-bufonly') " Delete all buffers except current
  call dein#add('gregsexton/MatchTag') " Match HTML tags
  call dein#add('sheerun/vim-polyglot') " Language syntax,detect,indent,etc pack

  call dein#add('junegunn/goyo.vim') " Distraction free vim editing

  call dein#add('dkprice/vim-easygrep') " Grep across multiple files

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

if (has("termguicolors"))
 set termguicolors
endif

" ================ Plugin config =====================
"
let g:deoplete#enable_at_startup = 1

let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "kalisi"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '                                "Set up spacing for sidebar icons

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']

let g:goyo_width = '100%'                                                         "100% chars width
let g:goyo_height = '100%'                                                        "100% height

let g:neosnippet#snippets_directory = [
            \ '/home/adam/.local/share/dein//repos/github.com//honza/vim-snippets/snippets',
            \ '~/.local/share/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets']

" ================ General Config ====================

let g:mapleader = ","                                                           "Change leader to a comma
let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme
colorscheme kalisi

set t_Co=256                                                                    "Set 256 colors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark                                                             "Set background to dark
" set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new splits positions

syntax on                                                                       "turn on syntax highlighting

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================ Indentation ======================

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set nofoldenable

" ================ Completion =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5


" ================ Custom mappings ========================

" Comment map
nmap <Leader>c gcc
" Line comment command
xmap <Leader>c gc

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
" Also save with ,w
nnoremap <Leader>w :w<CR>
nmap <Leader>k <Plug>(ale_previous_wrap)
nmap <Leader>j <Plug>(ale_next_wrap)

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Map for Escape key
inoremap jj <Esc>

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>


" Toggle distraction free mode
nnoremap <Leader>g :Goyo<CR>

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" ================ Abbreviations ====================

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe
cnoreabbrev den Denite

" ================ Functions ========================
function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction

function! s:LoadLocalVimrc()
    if filereadable(glob(getcwd() . '/.vimrc.local'))
        :execute 'source '.fnameescape(glob(getcwd(). '/.vimrc.local'))
    endif
endfunction

" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                  "Auto-remove trailing spaces
autocmd vimrc InsertLeave * NeoSnippetClearMarkers                              "Remove unused markers for snippets
autocmd vimrc InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd vimrc InsertLeave * :set cul                                            "Add cursorline highlight in normal mode
autocmd vimrc FileType html,javascript,coffee,cucumber setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
autocmd vimrc FileType php,javascript setlocal cc=80                            "Set right margin only for php and js
autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()         "Load per project vimrc (Used for custom test mappings, etc.)

autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc FileType nerdtree syntax match hideBracketsInNerdTree
\ "\]" contained conceal containedin=ALL
