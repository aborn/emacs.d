.emacs.d
==========

## INTRODUCTION
This project is a slight configure file for emacs.
emacs version 23 or later

## USAGE
Download all file in this project and running configure  
> $./sh/configure

You can also use git clone it to you home path
> cd ~  
> git clone https://github.com/aborn/.emacs.d.git

## GITHUB
1. generate the ssh key
2. copy the key to github.com
3. cp ./doc/config ~/.ssh/
4. git clone git@github.com:aborn/.emacs.d.git

> ... more refs to
  [github.sh](https://github.com/aborn/.emacs.d/blob/master/sh/github.sh
  "github.com clone setting initial.") and
  [git-usage](https://github.com/aborn/.emacs.d/blob/master/doc/git-usage.md
  "how to use git.")

## KEY-BINDING
C-control
M-meta/alt

1. choose color theme
	*  M-x color-theme-select

2. switch buffer    
	* C-x C-n  switch to next buffer
    * C-.      switch to next buffer
	* C-x C-p  switch to previous buffer
    * C-,      switch to previous buffer

3. other comands
	* C-x C-l  copy a whole line
	* C-i      just one space
	* C-o      switch to other window
    * C-x C-m  indent-region
    * C-x C-k  kill-buffer
    * M-w C-s  search and highlight all the matched content
    * C-x C-y  open sr-speedbar
    * C-c C-s  running matlab code
    * C-'      move point to middle of line
    * C-x C-e  eval-current-buffer
    * C-c C-j  active chinese wubi input method

> Note: for more detail key-binding, please refs to the file
> [keybinding.md](https://github.com/aborn/.emacs.d/blob/master/doc/keybinding.md 
> "all hot-key instructions in this repo")

## OTHER OPEN SOURCE CODE
* auto-complete version 1.3.1, the original package in  
 ~/.emacs.d/site-lisp/auto-complete1.3.1 and insatll using ins.sh, the   
 compiled in  ~/.emacs.d/site-lisp/auto-complete

## AUTHOR
Aborn Jiang (aborn.jiang@gmail.com)

## VERSION
* 2013-10-06 v0.1
* 2013-10-26 v0.2
* 2013-11-04 v1.0   (add ./configure for install)
* 2013-11-23 v1.1   (add markdown major)
* 2014-01-06 v1.2   (add matlab mode)
* 2014-01-14 v1.3   (add php mode)
* 2014-01-20 v1.3.1 (add % move point to matched bracket)
* 2014-01-23 v1.3.2 (add session and desktop mode setting)
* 2014-01-25 v1.3.3 (add chinese wubi input method )
* 2014-02-14 v1.3.4 (add switch to *shell* buffer)
* 2014-02-18 v1.3.5 (add sql mode)
* 2014-02-20 v1.3.6 (add switch-swift in iemacsfun)
