#!/bin/bash
######################################################
# BACKGROUND
#        if you have a repo in github.com and you want
#        to git pull into a new machine and push it.
# NAME   github.sh   
#        this script is used to pull a repo from 
#        github.com into local and push to
# USAGE  ./github.sh $REPONAME
# NOTE   
#        make sure:
#        1) ssh-keygen generate a key and copy to 
#           github.com
#        2) modify email address and user naem
#           as your email in github.com
######################################################
EMAILADDR="loveaborn@foxmail.com"
USERNAME="aborn"
REPONAME=$1
[ -z $REPONAME ] && REPONAME="emacs.lite"

git config --global push.default matching
git config --global push.default simple
git config --global user.name "${USERNAME}"
git config --global user.email "${EMAILADDR}"
git config --global core.editor emacs

CONFIGFILE="${HOME}/.ssh/config"

echo "Host github.com" > ${CONFIGFILE}
echo "User ${EMAILADDR}" >> ${CONFIGFILE}
echo "Port 443" >> ${CONFIGFILE}
echo "Hostname ssh.github.com" >> ${CONFIGFILE}

chmod 600 ${CONFIGFILE}
#git clone git@github.com:${USERNAME}/${REPONAME}.git
