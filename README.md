Ulitcs
==========

## INTRO
This project(**Ulitcs**) is a lite configure file for emacs.  
All configure files can be used emacs version 23 or 23+.

## DOWNLOAD
You can download all history release version from
[here](https://github.com/aborn/ulitcs/releases "Release Version
Download").

## INSTALL
You can install this repository configure using one of following
methods.  

1. Download all file in this project and running configure  
> wget https://github.com/aborn/.emacs.d/archive/master.zip  
> unzip master.zip  
> cd .emacs.d-master/  
> ./sh/configure  

2. Or, you can also use git clone it to you home path
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
Most key bindings are listed in file **key-binding.el**.  
Following list the **most popular hot-key**.   

* C-x C-n  switch to next buffer  [default C-.]
* C-x C-p  switch to previous buffer [default C-,]
* C-x C-l  copy a whole line
* C-i      just one space
* C-o      switch to other window
* C-x C-m  indent-region
* C-x k    kill-buffer
* M-w C-s  search and highlight all the matched content
* C-x C-y  open sr-speedbar
* C-'      move point to middle of line
* C-;      move forward by five line
* C-:      move backward by fine line
* C-x C-e  eval-current-buffer
* SHIFT-SPC  active chinese wubi input method
* M-$      ispell-word. Check and correct spelling of the word at point.
* C-c C-k  start-kbd-macro
* C-c C-l  end-kbd-macro
* C-c SPC  ace-jump-mode [also C-x SPC]
* C-j      swith-to-buffer
* M-j      find-file (open a file in a new buffer)
* M-m      switch to **shell** buffer

 Note: for more detail key-binding, please refs to the file
> [keybinding.md](https://github.com/aborn/.emacs.d/blob/master/doc/keybinding.md 
> "all hot-key instructions in this repo")

## OTHER OPEN SOURCE CODE
* all source code illustrations are showed in each module in file init.el

## DEPEND
* pls install "aspell ispell hunspell" before use checking and  
correcting spelling. ispell-*  M-$
* install following command to install this dependency.  
  > sudo apt-get install aspell ispell hunspell -y

## AUTHOR
Aborn Jiang (aborn.jiang@gmail.com)

## VERSION HISTORY
* 2013-10-06 v0.1
* 2013-10-26 v0.2
* 2013-11-04 v1.0   (add ./configure for install)
* 2013-11-23 v1.1   (add markdown major)
* 2014-01-06 v1.2   (add matlab mode)
* 2014-01-14 v1.3   (add php mode)
* 2014-01-20 v1.3.1 (add % move point to matched bracket)
* 2014-01-23 v1.3.2 (add session and desktop mode setting)
* 2014-01-25 v1.3.3 (add chinese wubi input method )
* 2014-02-14 v1.3.4 (add switch to \*shell\* buffer)
* 2014-02-18 v1.3.5 (add sql mode)
* 2014-02-20 v1.3.6 (add switch-swift in iemacsfun)
* 2014-03-02 v1.4   (add ace-jump-mode and quick-jump mode)
* 2014-03-02 v1.4.1 (add evil, that is, add vim mode)
* 2014-03-02 v1.4.2 (add highlight-tail-mode)
* 2014-03-04 v1.4.3 (add insert-date function)
* 2014-03-16 v1.4.4 (add some basic org-mode settings)
* 2014-03-20 v1.4.5 (add dream-theme and change it)
* 2014-04-07 v1.4.6 (add key-binding in key-binding.el file)
* 2014-04-21 v1.5   (add maxframe.el file)
* 2014-04-22 v1.5.1 (add insert-string.el in iemacsfun)
* 2014-04-23 v1.5.2 (project name **Ulitcs**, initial release)

## EMACS SCREENSHOT
* emacs dream-theme  
![](images/emacs-dream.png "my emacs dream-theme screenshot")

* emacs default-theme  
![](images/emacs-default.png "my emacs default-theme screen-shot")


