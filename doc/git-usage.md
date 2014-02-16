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

* git remote add upstream git://github.com/usr/repo.git
* git fetch upstream (fork)
* git merge upstream/master
## FAQ
1. fatal: Unable to find remote helper for 'https'
A. you should install curl, and libghc6-curl-dev libghc-curl-dev.
   finally, to reinstall git. git version is old.
   
2. error: Malformed value for push.default: simple?
A. git config --global push.default matching

## IGNORE
edit file ~/.gitignore_global with follow contents
>*~

>*.pyc

>*.class

>*.swp

and using follow command to active
>$git config --global core.excludesfile ~/.gitignore_global

