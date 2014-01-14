emacs.lite
==========

## INTRODUCTION
This project is a slight configure file for emacs.
emacs version 23 or after 

## USAGE
download all file in this project and running configure
> $./configure

## GITHUB
* generate the ssh key
* copy the key to github.com
* cp ./config ~/.ssh/
* git clone git@github.com:aborn/emacs.lite.git
* ... more github.com

## KEY-BINDING
C-control
M-meta/alt

1. choose color theme
	*  M-x color-theme-select

2. switch buffer 
	* C-x C-n  switch to next buffer
	* C-x C-p  switch to previous buffer

3. other comands
	* C-x C-j  erase buffer
	* C-x C-l  copy a whole line
	* C-i      just one space
	* C-o      switch to other window
	* C-x C-g  goto a specific line
	* C-x n/m  column maker (C-u C-u M-x column-marker-1 erases all highlighting)
    * C-x C-m  indent-region
    * C-x C-k  kill-buffer
    * M-w C-s  search and highlight all the matched content
    * C-x C-y  open sr-speedbar
    * C-c C-s  running matlab code

> Note: for more detail key-binding, please refs to the file keybinding.md

## OTHER OPEN SOURCE CODE
* auto-complete version 1.3.1, the original package in
 ~/.emacs.d/site-lisp/auto-complete1.3.1 and insatll using ins.sh, the 
 compiled in  ~/.emacs.d/site-lisp/auto-complete
 
## VERSION
* 2013-10-06 v0.1
* 2013-10-26 v0.2
* 2013-11-04 v1.0 (add ./configure for install)
* 2013-11-23 v1.1 (add markdown major)
* 2014-01-06 v1.2 (add matlab mode)

## AUTHOR
Aborn Jiang (aborn.jiang@gmail.com)
