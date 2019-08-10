#!/usr/bin/env bash
# -*- coding: utf-8 -*-

###################### TERESA ###############################
cd merge-rebase-demo
echo $'Clone git repo\n'
git clone git@github.com:mobile-release-engineering/merge-rebase-demo.git teresa
cd teresa

echo $'Set Current user as Teresa\n'
git config --local user.name "Teresa" && git config --local user.email "teresa@example.com"

echo $'Get all branches from remote\n'
git fetch --all

###################### TERESA ###############################

echo $'Checkout develop\n'
git checkout develop

echo $'branch teresa\n'
git checkout -b teresa

TEXT=T1 && echo $TEXT >> ./teresa.txt && git add . && git commit -m "$TEXT"
sleep 2
TEXT=T2 && echo $TEXT >> ./teresa.txt && git add . && git commit -m "$TEXT"
sleep 2
TEXT=T3 && echo $TEXT >> ./teresa.txt && git add . && git commit -m "$TEXT"

echo $'Push teresa to remote\n'
git push -u origin teresa

echo $'Print Graph\n'
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit