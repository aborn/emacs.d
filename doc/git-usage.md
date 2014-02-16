git-usage
==========

## INTRODUCTION
This file content tells your how to use git when you forget it!!

## MAIN COMMAND

* git remote add origin git@github.com:aborn/emacs.lite.git
* git add -A .
* git commit -m "project:auto-send-weibo"
* git pull origin master
* git push origin master
* git push --set-upstream origin master (after you can use git push)
* git config --list
* git config --global core.editor emacs
* git config --global user.name "Aborn Jiang"
* git config --global user.email "loveaborn@foxmail.com"
* git init
* git clone git@github.com:usr/repo.git
* git clone https://github.com/aborn/emacs.lite.git
  (sudo apt-get install libghc6-curl-dev libghc-curl-dev, reinstall git)
* git remote add upstream git://github.com/usr/repo.git
* git fetch upstream (fork)
* git merge upstream/master

## IGNORE
edit file ~/.gitignore_global with follow contents
>*~

>*.pyc

>*.class

>*.swp

and using follow command to active
>$git config --global core.excludesfile ~/.gitignore_global

