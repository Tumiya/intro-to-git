# INTRO TO GIT

By the end of this document, you should be familiar with the basic functions of Git.

### Setup

1. Make a local folder using your terminal.
```
mkdir [folder name]
```
2. Switch into your folder then initialize git.
```
git init
```
You're ready to get started!

## Activity One: Staging Files

Changes within your repository are tracked by git, but none of the changes will be finalized until you have commited these changes.
Before we learn how to commit we must first understand how git handles these changes. Only changes in the staging area with can be 
commited, so in order to commit changes we must first add these changes into the staging area.

1. First lets make a few new files.
```
touch file.txt
touch file.csv
touch file.html
touch different.txt
touch hello.txt
```
2. Let's check how git sees the addition of these files.
```
git status
```
This should show all the files you have created as untracked files.

**I would recommend you use git status after each step so you can see what git is doing.**You 

3. Next, lets add these changes into the staging area.
```
git add .
```
**This will add ALL the changes in your repo into the staging area.**

What if we only want to add certain files into the staging area? Before we can do that lets remove the files we added into the
staging area.
```
git rm --cached [file name]
```
This will remove that specific file out of the staging area. This could get tedious if you have to remove all 5 files. 
Here is how you can remove all the files at the same time.
```
git rm --cached -r .
```

Now that we know how to add and remove files from the staging area lets experiment with adding specific files.

Try each of these commands individually and check what happens using ```git status```. 
**Note:** make sure you do ```git rm --cache -r .``` before using the next command. 
```
git add different.txt
git add *.txt
git add file*
git add *i*
```
