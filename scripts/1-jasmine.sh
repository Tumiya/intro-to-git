#!/usr/bin/env bash
# -*- coding: utf-8 -*-

###################### AUTHOR ###############################
echo $'Create & navigate to dir merge-rebase-demo/jasmine\n'
mkdir -p merge-rebase-demo/jasmine
cd merge-rebase-demo/jasmine

echo $'Initialize git repo\n'

git init

echo $'Set Current user as Author\n'
git config --local user.name "Author" && git config --local user.email "author@example.com"

echo $'Add Existing Remote\n'
git remote add origin git@github.com:mobile-release-engineering/merge-rebase-demo.git

#git branch

echo $'Create Empty Commit\n'
git commit -m "Initial Commit" --allow-empty

echo $'Push master to remote\n'
git push -u origin master


git checkout -b develop
echo $'Push develop to remote\n'
git push -u origin develop

###################### JASMINE ###############################

echo $'Set Current user as Jasmine\n'
git config --local user.name "Jasmine" && git config --local user.email "jasmine@example.com"

echo $'Checkout new branch named jasmine\n'
git checkout -b jasmine


echo $'Create few commits\n'
TEXT=J1 && echo $TEXT >> ./jasmine.txt && git add . && git commit -m "$TEXT"
sleep 2
TEXT=J2 && echo $TEXT >> ./jasmine.txt && git add . && git commit -m "$TEXT"
sleep 2
TEXT=J3 && echo $TEXT >> ./jasmine.txt && git add . && git commit -m "$TEXT"


echo $'Push jasmine to remote\n'
git push -u origin jasmine

echo $'Print Graph\n'
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

### To Delete branch
# git checkout -b backup
# git branch -D master develop jasmine
# git push --delete master develop jasmine -f