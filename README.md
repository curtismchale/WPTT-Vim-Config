# WPTT-Vim-Config

This is my custom Vim configuration which is really for MacVim. Use it if you want or don't.

I type DVORAK so some of my mappings may feel odd for you silly QWERTY people. I won't be taking any pull requests to change mappings (unless you have a really good case to prove me wrong).

## Install

Change to your root directory `cd ~/` and then clone the repository.

`git clone --recursive https://github.com/curtismchale/WPTT-Vim-Config.git .vim`

Now use a symlink to point your .vimrc and .gvimrc files to the .gvimrc file inside the .vim folder. Back up your .gvimrc and .vimrc files if you aren't sure you want to make the jump with me.

`ln -s .vim/.gvimrc .gvimrc && ln -s .vim/.gvimrc .vimrc`

Now all your vim/gvim configs are done in `.vim/.gvimrc`.

There are a few dependencies that you'll need that don't come with the repository.

1. [Exuberant CTags](http://ctags.sourceforge.net/) - `brew install ctags`. If you don't have homebrew installed [go get it](http://brew.sh/)
2. [Ack](http://beyondgrep.com/) - `brew install ack`

## Update

To update the project you need to pull the master branch then pull each submodule with the command below.

`git pull origin master && git submodule update --init --recursive`

## Submodules

### Pathogen

Makes a bunch of stuff in the install process of Vim plugins easier

### ACK

Need this for CTRLP searching

### CTRLP

Mapped to <leader>p and does project searching like of files.

There is a custom ignore pattern in the .gvimrc file for directories that I usually ignore in projects.

### Align

Makes alignment smart and easy.

### NerdCommenter

Allows comment templates for functions.

### NERDTree

File browser bar on the side of your editor.

### PDV

PHP stuff for Vim

### Syntastic

Syntax highlighting

### Vim Colors Solarized

My prefered colour scheme

### Vim LESS

LESS syntax for Vim

### Vim Markdown

Markdown highlighting for Vim

### [WordPress.vim](https://github.com/dsawardekar/wordpress.vim)

Adds a bunch of awesome WordPress specific functions like support for actions/filters in goto definitions.

