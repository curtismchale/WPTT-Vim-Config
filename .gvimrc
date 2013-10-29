"""""""""""""""""""""""""""
" => Pathogen for some sane package management
"""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

" mapping my leader to comma
let mapleader = ","
let g:mapleader = ","

set exrc  " project level .vimrc files

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


"let g:ctrlp_working_path_mode = 'c'     " set CtrlP to search the current directory in Vim first

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['debug[[dir]]', 'hyperdb[[dir]]', 'gravity[[dir]]', 'akismet[[dir]]', 'user-switching[[dir]]', 'wp-migrate-db-pro[[dir]]', 'upgrade[[dir]]', 'uploads[[dir]]', 'twenty*[[dir]]']

" indenting
set autoindent
set smarttab

" autoloading changed files
set autoread

" nerdcommenter
filetype plugin on

" PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>

"""""""""""""""""""""""""""
" Colours and Fonts
"""""""""""""""""""""""""""

" Syntax Highlighing
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
if has( "gui_macvim" ) && has( "gui_running" )
  set background=dark
  colorscheme solarized
endif

" setting my default font sizes
set guifont=Monaco:h14

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
set tabstop=4                       " a tab is four spaces
set shiftwidth=4                    " an autoindent (with <<) is four spaces
"set expandtab                       " spaces not tabs
set list                            " show invisibles
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<  "decides what whitespace to shaw
set nowrap                          " don't wrap lines
set backspace=indent,eol,start      " backspace through everything in insert mode

" line numbers
set number
set ruler

" List chars
set listchars=""                      " Reset the listchars
set listchars=tab:\ \                 " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.                " show trailing spaces as dots
set listchars+=extends:>              " The character to show in the last column when wrap is
                                      " off and the line continues beyond the right of the screen
set listchars+=precedes:<             " The character to show in the last column when wrap is
                                      " off and the line continues beyond the right of the screen
autocmd BufWritePre * :%s/\s\+$//e    " remove trailing spaces on save

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => View Ports
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Adjust viewports to the same size
map <leader>= <C-w>=
