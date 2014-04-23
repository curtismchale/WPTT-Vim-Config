# WPTT-Vim-Config

This is my custom Vim configuration which is really for MacVim. Use it if you want or don't.

I type DVORAK so some of my mappings may feel odd for you silly QWERTY people. I won't be taking any pull requests to change mappings (unless you have a really good case to prove me wrong).

## Install

Change to your root directory `cd ~/` and then clone the repository.

`git clone https://github.com/curtismchale/WPTT-Vim-Config.git .vim`

Install [Vundle](https://github.com/gmarik/Vundle.vim) by typing `git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle`

Now use a symlink to point your .vimrc and .gvimrc files to the .gvimrc file inside the .vim folder. Back up your .gvimrc and .vimrc files if you aren't sure you want to make the jump with me.

`ln -s .vim/.gvimrc .gvimrc && ln -s .vim/.gvimrc .vimrc`

Now all your vim/gvim configs are done in `.vim/.gvimrc`.

Open vim and then type `:BundleInstall` which tells Vundle to install all the bundles defined in your Vim config.

There are a few dependencies that you'll need that don't come with the repository.

1. [Exuberant CTags](http://ctags.sourceforge.net/) - `brew install ctags`. If you don't have homebrew installed [go get it](http://brew.sh/)
2. [Ack](http://beyondgrep.com/) - `brew install ack`

## Update

Pull the master branch for this repository then use the Vundle update command below.

`:BundleInstall!`

## Submodules

### [Vundle](https://github.com/gmarik/Vundle.vim)

Sane package management for Vim. No more submodules


### [ack.vim](https://github.com/mileszs/ack.vim)

Need this for CTRLP searching. **Don't forget you need ACK installed on your computer as well.**

### [CTRLP](https://github.com/kien/ctrlp.vim)

Mapped to <leader>p and does project searching of files just like that fancy IDE you have around.

There is a custom ignore pattern in the .gvimrc file for directories that I usually ignore in projects.

### [Align](https://github.com/tsaleh/vim-align)

Makes alignment smart and easy.

```php
$args = array(
	'post_type' => 'portfolio',
	'posts_per_page' => -1,
);
```

Given the code above highlight it all then type `:Align =>` to get the results below.

```php
$args = array(
	'post_type'      => 'portfolio',
	'posts_per_page' => -1,
);
```

Will also work with other symbols like `=`.

### [NerdCommenter](https://github.com/scrooloose/nerdcommenter)

According to the README on the project this is orgasmic commenting. What that means practically for you is given the code below:

```php
function something( $var ){

} // something
```

You can be on the first line and type `<leader>ci` to toggle the comment state of the first line.

Lots more information in the documentation on the project so go read it.

### [NERDTree](https://github.com/scrooloose/nerdtree)

File browser bar on the side of your editor.

Default toggle is `<leader>d`. If you want to show hidden files type `I` while in NERDTree.

I've added a custom ignore pattern for files often in my WordPress projects that I don't actually want to see in NERDTree like all the debug-bar* plugins.

### [PDV](https://github.com/tobyS/pdv)

In theory this does PHP docblock building for you, but it doesn't work right now.

https://github.com/curtismchale/WPTT-Vim-Config/issues/4

### [Syntastic](https://github.com/scrooloose/syntastic)

Syntax highlighting that's better. Will show you PHP errors with `>>` in the side of your editor.

### [Vim Colors Solarized](https://github.com/altercation/vim-colors-solarized)

My prefered colour scheme

### [Vim LESS](https://github.com/groenewege/vim-less)

LESS syntax for Vim

### [Vim Markdown](https://github.com/plasticboy/vim-markdown)

Markdown highlighting for Vim

### [WordPress.vim](https://github.com/dsawardekar/wordpress.vim)

Adds a bunch of awesome WordPress specific functions like support for actions/filters in goto definitions.

Check out the repository above to see the power that's now at your finger tips.

### [Smart Tabs](https://github.com/vim-scripts/Smart-Tabs)

WordPress wants tabs up front and spaces for alignment in the middle of the line. Smart Tabs does this for us.

### Setting up CTags

CTags are very powerful but always feel like dark magic. There are a few steps to generate Ctags.

**First**: Start by changing directory `cd` to the top level of your project which should be at the same level of your `wp-config.php`. Now type `ctags -R --exclude=node_modules`. That will recursively generate your CTags but ignores the `node_modules` folder. I've just always had trouble with tags and that folder.

**Second**: Tell Vim about your tags. The easiest way to to add a project level `.vimrc` file `set tags+=./tags,tags,~/Path/to/your/site/tags`. That final path should be to the tags file set at the same level as your project `wp-config.php`.

**Third**: Generate tags again after some changes. I'm told that you can get your CTags generating for yourself on a git hook but I've had trouble which probably has more to do with my bash skills than anything. Here is the [issue](https://github.com/curtismchale/WPTT-Vim-Config/issues/5) for me to figure it out and the link to the tutorial on setting it up.
