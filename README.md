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
touch file.txt anotherFile.txt andAnotherOne.txt hello.txt helloWorld.txt
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

1. Make some changes while you are in master. Do not use ```git add```.

2. Stash your changes
```
git stash
```
_This command will hold on to the changes you have made to this branch and allow you to use it for later_

3. Let's look at our stash
```
git stash list
```
_This will show us the list of changes we have stashed_

We can get more details about individual stashed changes by using
```
git stash show
```
_This will show the details of your stash. If you do not declare a stash, it will default to using stash@{0} and if you want even more details try adding the **-v** flag_

So how do we use stash?

4. Create a new branch and switch into it.
5. Let's apply the stash
```
git stash apply
```
_This will apply all the changes in stash@{0}_

You could also use 
```
git stash pop
``` 
_This will do ```git apply``` then drop the stash_

You can hold on to multiple stashes at the same time. New stashes will always be stored in stash@{0}, and existing stashes will be incremented by 1. 

All stash commands defaults to using stash@{0} (the most recent stash). Just change the value if you want to specify a stash.

Try creating a few more stashes. Use the previous commands with specific stashes. Once you are done, lets start cleaning up.

6. Let's get rid of a stash
```
git stash drop stash{x}
```
_x being the stash number for the stash you want to get rid of. This will remove a single stash_

If you want to just clear your entire stash list 
```
git stash clear
```

## Activity Five: Remotes

Before we do some git commands lets set up a remote repo using github.

1. Click on the **+** sign on the top left of your page.

<img src="https://github.com/mobile-release-engineering/intro-to-git/blob/master/screenshots/plus.png" width="154" height="138">

2. Choose a name for your new repo and click create repository

<img src="https://github.com/mobile-release-engineering/intro-to-git/blob/master/screenshots/new_repo.png" width="468" height="447">

Once you have create your repo, lets go back to our terminal.

3. Let's connect our local repo to the online repo. Grab the link for your online repo, use the https url is you have not set up your git to work with ssh.
```
git remote add [remote name] [link]
```
4. Setup an upstream to your branch
```
git push -u [remote name] master
```
_once your upstream is set it will create a reference between your local and remote branch, you can just use git push on that branch moving forward._

But what if we need to pull a branch from our remote repo that doesnt exist locally? How would we create a reference?

5. We fetch our branches 
```
git fetch
```
_This will fetch the default remote you have set (if you have multiple remotes). You can target a specific remote by specifying a name after fetch_

6. Then we ```git checkout``` the branch that we want. To look at our remote branches we have use
```
git branch --list -r
```

By now you should have a good understanding of basic git actions. Time to dig in deeper.

## Congratulations!

You made it to the end. Please complete our survey on how we can improve future events.
[Intro to Git Survey](https://www.surveymonkey.com/r/CRG22G5)








