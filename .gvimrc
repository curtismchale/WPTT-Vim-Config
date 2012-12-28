"""""""""""""""""""""""""""
" => Pathogen for some sane package management
"""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

" mapping my leader to comma
let mapleader = ","
let g:mapleader = ","

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
map <leader>p :CtrlP<space>
let g:ctrlp_working_path_mode = 'c'     " set CtrlP to search the current directory in Vim first

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" indenting
set autoindent

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
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set tabstop=2                       " a tab is two spaces
set shiftwidth=2                    " an autoindent (with <<) is two spaces
set expandtab                       " spaces not tabs
set list                            " show invisibles
set nowrap                          " don't wrap lines
set backspace=indent,eol,start      " backspace through everything in insert mode

" line numbers
set number
set ruler

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

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
