# WPTT-Vim-Config

This is my custom Vim configuration which is really for MacVim. Use it if you want or don't.

I type DVORAK so some of my mappings may feel odd for you silly QWERTY people. I won't be taking any pull requests to change mappings (unless you have a really good case to prove me wrong).

## Install

Change to your root directory `cd ~/` and then clone the repository.

`git clone https://github.com/curtismchale/WPTT-Vim-Config.git .vim`

Install [Vundle](https://github.com/gmarik/Vundle.vim) by typing `git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/vundle`

Now use a symlink to point your .vimrc and .gvimrc files to the copies inside the .vim folder. Back up your .gvimrc and .vimrc files if you aren't sure you want to make the jump with me.

`ln -s ~/.vim/.gvimrc ~/.gvimrc && ln -s ~/.vim/.vimrc ~/.vimrc`

Now all your vim/gvim configs are done in `.vim/.vimrc` and `.vim/.gvimrc`.

Open vim and then type `:BundleInstall` which tells Vundle to install all the bundles defined in your Vim config.

There are a few dependencies that you'll need that don't come with the repository.

1. [Exuberant CTags](http://ctags.sourceforge.net/) - `brew install ctags`. If you don't have homebrew installed [go get it](http://brew.sh/)
2. [Ack](http://beyondgrep.com/) - `brew install ack`

### Problems with Git Commit Messages
On a Mac, if you're getting the message
```
error: There was a problem with the editor 'vi'.
Please supply the message using either -m or -F option.
```
when you try to create a Git commit message with Vim, the issue is an [incorrect error code being returned](http://tooky.co.uk/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x/).

You can fix this problem by running
`git config --global core.editor /usr/bin/vim`

## Update

Pull the master branch for this repository then use the Vundle update command below.

`:BundleInstall!`

## Submodules

### [Vundle](https://github.com/gmarik/Vundle.vim)

Sane package management for Vim. No more submodules


### [ack.vim](https://github.com/mileszs/ack.vim)

Need this for CTRLP searching. **Don't forget you need ACK installed on your computer as well.**

Basic Usage `:Ack [options] {pattern} [{directories}]`  
Example `:Ack 'my_title_filter\(''`

### [CTRLP](https://github.com/kien/ctrlp.vim)

`Ctrl+p` or `<leader>p` in normal mode does project searching of files just like that fancy IDE you have around.

There is a custom ignore pattern in the .vimrc file for directories that I usually ignore in projects.

### [Align](https://github.com/tsaleh/vim-align)

Makes alignment smart and easy.

```php
$args = array(
	'post_type' => 'portfolio',
	'posts_per_page' => -1,
);
```

Given the code above highlight it all then type `:A =>` to get the results below.

```php
$args = array(
	'post_type'      => 'portfolio',
	'posts_per_page' => -1,
);
```

Will also work with other symbols like `=`.

The default mapping for Align is `:Align $symbol`. I type that wrong way to much so here it's mapped to `:A $symbol` to cut down the typing needed.

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

`<leader>n` toggles the file browser.

Shortcuts inside NERDTree  
`I`: Toggle hidden files  
`?`: Toggle NERD Tree's quick help  
`m`: Show the NERD Tree menu  
`t`: Open the selected file in a new tab  
`R`: Refresh the tree, useful if files change outside of Vim  
`i`: Open the selected file in a horizontal split window  
`s`: Open the selected file in a vertical split window  

I've added a custom ignore pattern for files often in my WordPress projects that I don't actually want to see in NERDTree like all the debug-bar* plugins.

### [PDV](https://github.com/tobyS/pdv)

Allows you to make docblocks fast. Here it's mapped to <leader>d. I don't currently having it using Utlsnip templates but will look in to it in the future.

PDV requires [vmustache](https://github.com/tobyS/vmustache) for it's internal templating engine.


### [Syntastic](https://github.com/scrooloose/syntastic)

Syntax highlighting that's better. Will show you PHP errors with `>>` in the side of your editor.

### [Vim Colors Solarized](https://github.com/altercation/vim-colors-solarized)

My prefered colour scheme set to dark mode and will be the colour for terminal vim and MacVim if you're using it.

If you're running in iTerm 2 (like me) then you need to download the [Solarized Scheme](https://github.com/altercation/solarized) and then import it. Proper directions can be found in the readme [here](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized).

### [Vim LESS](https://github.com/groenewege/vim-less)

LESS syntax for Vim

### [Vim Markdown](https://github.com/plasticboy/vim-markdown)

Markdown highlighting for Vim

### [WordPress.vim](https://github.com/dsawardekar/wordpress.vim)

Adds a bunch of awesome WordPress specific functions like support for actions/filters in goto definitions.

Check out the repository above to see the power that's now at your finger tips.

### [Smart Tabs](https://github.com/vim-scripts/Smart-Tabs)

WordPress wants tabs up front and spaces for alignment in the middle of the line. Smart Tabs does this for us.

### [Vim Airline](https://github.com/bling/vim-airline)

Light weight status line for Vim.

### [Vim Fugitive](https://github.com/tpope/vim-fugitive)

Bring some more Git goodness right in Vim.

### Setting up Ctags

Ctags are very powerful but always feel like dark magic. There are a few steps to generate ctags.

**First**: Start by changing directory `cd` to the top level of your project which should be at the same level of your `wp-config.php`. Now type `ctags --tag-relative -Rf.git/tags --exclude=node_modules --exclude=.git --languages=-javascript,sql`. That will:
- recursively generate your tags
- write the file inside your `.git` directory, so it is automatically read by Vim Fugitive
- ignore all fies in the `node_modules` folder when generating tags
- ignore all file int he `.git` directory folder when generating tags

**Second**: Generate tags again after some changes. I'm told that you can get your tags generating for yourself on a git hook but I've had trouble which probably has more to do with my bash skills than anything. Here is the [issue](https://github.com/curtismchale/WPTT-Vim-Config/issues/5) for me to figure it out and the link to the tutorial on setting it up.

Once, this command is run re-open your files in Vim and
completion (using `Ctrl+p` or `Tab`) should use the tags generated
information.
