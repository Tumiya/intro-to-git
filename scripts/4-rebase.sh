#!/usr/bin/env bash
# -*- coding: utf-8 -*-

cd merge-rebase-demo/jasmine
git fetch --all

git checkout teresa
git checkout jasmine

git checkout -b rebase-test
git config --local user.name "Author" && git config --local user.email "author@example.com"

git rebase teresa

git push -u origin rebase-test

echo $'Print Graph\n'
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit