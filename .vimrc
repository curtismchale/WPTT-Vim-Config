set nocompatible    " be iMproved, required
filetype off        " required by Vundle, re-enabled below

" set runtime path
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage vundle
Plugin 'gmarik/vundle'

" searching and file management
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" Alignment and commenting
Bundle 'tsaleh/vim-align'
Bundle 'tobyS/vmustache'
Bundle 'tobyS/pdv'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/Smart-Tabs'

" Hints
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'dsawardekar/wordpress.vim'
Bundle 'shawncplus/phpcomplete.vim'

" Syntax
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'StanAngeloff/php.vim'

" colors
Bundle 'altercation/vim-colors-solarized'

" Dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Misc
Bundle 'tyru/open-browser.vim'
Bundle 'bling/vim-airline'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" re-enable filetype
" must be after all Vundle Bundles are loaded
filetype on

" mapping my leader to comma
let mapleader = ","
let g:mapleader = ","

" project level .vimrc files
set exrc

"""""""""""""""""""""""""""
" => use clipboard as primary register for y,d,p
"""""""""""""""""""""""""""
set clipboard=unnamed

"""""""""""""""""""""""""""
" => Airline stuff basically stolen at this point from Travis Northcutt
"""""""""""""""""""""""""""
set laststatus=2                        " Enable statusline
set t_Co=256
let g:airline_theme='solarized'

set statusline=
set statusline+=%{fugitive#statusline()} " Add git status from vim-fugitive plugin
set statusline+=%tyru                    " tail of the filename
set statusline+=%=                      " left/right separator
set statusline+=%c,                     " cursor column
set statusline+=%l/%L                   " cursor line/total lines
set statusline+=\ %P                    " percent through file

"""""""""""""""""""""""""""
" => Searching Stuff
"""""""""""""""""""""""""""
" ignore case when searching
set ignorecase

" highlight search results
set hlsearch

" incriment search
set incsearch

" mapping search with Ack
map <leader>f :Ack<space>

" CTRL P
map <leader>p :CtrlP<cr>
nnoremap <silent> <leader>r :ClearCtrlPCache<cr>
let g:ctrlp_custom_ignore =['debug[[dir]]', 'gravity[[dir]]', 'akismet[[dir]]', 'user-switching[[dir]]', 'wp-migrate-db-pro[[dir]]', 'upgrade[[dir]]', 'uploads[[dir]]', 'twenty*[[dir]]']
let g:ctrlp_working_path_mode = 'c'     " set CtrlP to search the current directory in Vim first

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" NERDTree
map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['debug[[dir]]', 'hyperdb[[dir]]', 'gravity[[dir]]', 'akismet[[dir]]', 'user-switching[[dir]]', 'wp-migrate-db-pro[[dir]]', 'upgrade[[dir]]', 'uploads[[dir]]', 'twenty*[[dir]]']

" indenting
set autoindent
set smarttab

" autoloading changed files
set autoread

" nerdcommenter
filetype plugin on

" PDV - PHP documenter script
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
map <leader>d :call pdv#DocumentCurrentLine()<CR>

"""""""""""""""""""""""""""
" Colours and Fonts
"""""""""""""""""""""""""""

" Syntax Highlighing
syntax enable
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Setting solarized dark
set background=dark
colorscheme solarized

" setting my default font sizes
set guifont=Monaco:h13

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

set wrap linebreak nolist

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" 1 tab == 4 spaces
set tabstop=4                                           " a tab is four spaces
set shiftwidth=4                                        " an autoindent (with <<) is four spaces
set list                                                " show invisibles
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:< " decides what whitespace to shaw
set nowrap                                              " don't wrap lines
set backspace=indent,eol,start                          " backspace through everything in insert mode

" line numbers
set number
set ruler

autocmd FileType c,cpp,java,php,javascript autocmd BufWritePre * :%s/\s\+$//e    " remove trailing spaces on save


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Modify word boundary characters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove - as a word boundary (i.e. making a keyword character)
set iskeyword+=-
" remove $ as a word boundary (i.e. making a keyword character)
set iskeyword+=$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wild settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Node and JS stuff
set wildignore+=*/node_modules/*,*.min.js

" WP Language files
set wildignore+=*.pot,*.po,*.mo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => View Ports
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Adjust viewports to the same size
map <leader>= <C-w>=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings and Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map jk to ESC in visual mode
"http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
inoremap jk <esc>

" Map 
" :A $symbol 
" to 
" :Align $symbol
" as a shortcut for vim-align plugin
com! -bang -range -nargs=* A <line1>,<line2>call Align#Align(<bang>0,<q-args>)

" Map <leader>ev (i.e. \ev) to edit .vimrc
" and <leader>sv to source (apply) .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Map <leader>eg (i.e. \eg) to edit .gvimrc
" and <leader>sg to source (apply) .gvimrc
nnoremap <leader>eg :split $MYGVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>

" Map <leader>el to error_log value
" takes the whatever is under the cursor and wraps it in error_log( and
" print_r( with parameter true and a label
autocmd FileType php nnoremap <leader>el ^vg_daerror_log( '<esc>pa=' . print_r( <esc>pa, true ) );<cr><esc>

" Map <leader>ts2 to expand (t)abs to (s)paces with (2) characters indicating a tab
nnoremap <leader>ts2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

" Map <leader>ts4 to expand (t)abs to (s)paces with (4) characters indicating a tab
nnoremap <leader>ts4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

" Map <leader>tt2 to (t)abs to be treated as (t)ab characters and display as (2) characters
nnoremap <leader>tt2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

" Map <leader>tt4 to (t)abs to be treated as (t)ab characters and display as (4) characters
nnoremap <leader>tt4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>

