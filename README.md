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

_Try making some change to your repo and create your own commit._

3. Let's see the commit you have so far.
```
git log
```
_This will show you important information about your commit history, such as the commit hash, author name and author date._

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
_This should show all the files you have made the changes to, which would be all the .txt files._

3. Next, lets add these changes into the staging area.
```
git add .
```
**This will add ALL the changes in your repo into the staging area.**

_Check **```git status```** before moving into the next step. What do you notice?_ 

4. Now let's remove files from the staging.
```
git reset HEAD file.txt
```
_This would have remove file.txt from the staging area. Check **```git status```**_

5. Now that the changes you have made on file.txt are unstaged, lets discard these changes completely. 
```
git checkout -- file.txt
```
Do **```git status```** again except this time add a **-v** flag.
```
git status -v
```
_This will show you additional details on the changes on that files that you currently have in the staging area._

Here are some helpful commands if you're tired of doing git add before doing git commit.

**```git commit -am [commit message]```** will add all your changes to the staging area and commit these changes.

**```git commit -m [commit message] [file name]```** will add the file specified into the staging area and commit the changes.

## Activity Three: Branching Out

Now that we know how to move around the staging area and commit our changes. Its time we learn how to deal with branches. There will be times when you would be working on the same project with multiple developers and usually that means that you might be modifying files at the same times. The best way to do this is by using branches. 

1. First lets look at our existing branch 
```
git branch
```
_This should only show that we only have the master branch._

2. Let's make a new branch
```
git branch [branch name]
```
_Once you have done this use ```git branch``` again to view your see if your new branch has been created._

3. If you have successfully created a new branch, it is time to move into it.
```
git checkout [branch name]
```
_Lets make a commit in this branch then check your **```git log```** on both branches._ 

If you have done everything correctly, your branch should be ahead a commit from master. The changes on your branch will remain in your branch until you choose to merge these changes, but before we learn how to merge let's try another neat trick.

Did you notice that we also used checkout to discard the changes we made earlier? Checkout basically restores your file based on the latest commit on the branch you specified (if you do not declare a branch it defaults to your working branch). This means that we could actually update files using commits on another other branch.

Try this command while on the master branch. The file name being the file you modified on the other branch. 
```
git checkout [branch name] [file name]
```
_Once that command goes through successfully, do a **```git status -v```** to see what happened._

## Activity Four: Stash it 

You're probably itching to do some git merges and learn how to deal with those merge conflicts already. Unfortunately we are not there just yet. What if you have made some changes but you're not ready to commit just yet? Well you can stash your changes! It is exactly what it sounds like, you are basically holding on to these changes until you are ready to do something with them.




