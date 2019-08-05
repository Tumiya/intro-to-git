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

## Activity One: First Commit

Remember that a commit is basically a snapshot of your repository. A new commit would create a snapshot of the changes that are curently in the staging area. 

1. First lets make a few new files.
```
touch file.txt
touch file.csv
touch file.html
touch different.txt
touch hello.txt
```
2. Let's add all the files in the staging area.
```
git add .
```
**This will add ALL the changes in your repo into the staging area.**

3. Commit the changes in the staging area.
```
git commit
```
This command will open a file and prompt you for a commit message.

_**Note:** If you have never used vi editor before, you need to press **i** to go into insert mode and hit **esc** once you are done. You can close this prompt by entering **:wq**_

Alternatively, we can use the **-m** flag to avoid the commit message prompt
```
git commit -m [commit message]
```

Try making some change to your repo and create your own commit.

3. Let's see the commit you have so far.
```
git log
```
This will show you important information about your commit history, such as the commit hash, author name and author date.

Now that we know how to make commits, lets learn how to maneuver around the staging area.

## Activity Two: Maneuvering The Stage

Changes within your repository are tracked by git, but none of the changes will be finalized until you have commited these changes. Only changes in the staging area can be commited, so in order to commit changes we must first add these changes into the staging area.

1. First lets make some changes in the files we made earlier.
```
echo hello | tee *.txt
```
**This command has nothing to do with git, its just a quick way to make changes in all the files with the .txt extension**

2. Let's check how git sees the addition of these files.
```
git status
```
This should show all the files you have made the changes to, which would be all the .txt files.

3. Next, lets add these changes into the staging area.
```
git add .
```
**This will add ALL the changes in your repo into the staging area.**

Check ```git status``` before moving into the next step. What do you notice? 

4. Now let's remove files from the staging.
```
git reset HEAD file.txt
```
This would have remove file.txt from the staging area. Check ```git status```

5. Now that the changes you have made on file.txt are unstaged, lets discard these changes completely. 
```
git checkout -- file.txt
```
Do ```git status``` again except this time add a **-v** flag.
```
git status -v
```
This will show you additional details on the changes on that files that you currently have in the staging area.

Here is a quick tip before we tackle the next activity.

```git commit -am [commit message]``` will add all your changes to the staging area and commit these changes.

```git commit -m [commit message] [file name]``` will add the file specified into the staging area and commit the changes.

## Activity Three: Branching Out
