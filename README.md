# dotfiles
Here's my setup for `screen`, `vim`, `zathura` and some scripts for
working with notes and bibliography in the command line.

# Usage
This repo is intended to be used with [GNU
Stow](https://www.gnu.org/software/stow/) version 2.3 and up. If you're using
an earlier version of stow, remember to edit `.stowrc` to your actual
`${HOME}`, as earlier versions don't expand variables in the rc file.

## vim
`vim` plugins are installed as [git
submodules](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/).
In order to clone them you must run `git submodule update --init` after cloning
this repo. The submodules can then be updated all at once by running `git
submodule update --remote && git submodule update` in this repo's root
directory.

Color theme is [One Dark](https://github.com/joshdick/onedark.vim).

### References:
 - [Luke Smith](https://github.com/LukeSmithxyz/voidrice)
 - [Nick Janetakis](https://github.com/nickjj/dotfiles/)
 - [Conner McDaniel](https://github.com/connermcd/dotfiles)

 ## Scripts
 Bibliography management and notetaking scripts, especially from [Luke
 Smith](lukesmoth.xyz) and [Conner McDaniel](https://github.com/connermcd/bin).

 ## Zathura
- Support for synctex based on [Gautam
  Iyer](http://www.math.cmu.edu/~gautam/sj/blog/20140310-zathura-fsearch.html)'s
  tip and [a Stack Exchange
  answer](https://tex.stackexchange.com/a/412366/4844).
