## This is the readme for the DG project 
although i am using it to practice github

###### If u get commit error
 "Your branch is ahead of 'origin/master' by x commits"
use: git reset --hard origin/master
in the terminal of Rstudio
this resets git commits to whatever is saved locally (i think)

#### From https://happygitwithr.com/rstudio-git-github.html
#### Make local changes, save, commit

From RStudio, modify the README.md file, e.g., by adding the line “This is a line from RStudio”. Save your changes.

Commit these changes to your local repo. How?

From RStudio:

    Click the “Git” tab in upper right pane.
    Check “Staged” box for README.md.
    If you’re not already in the Git pop-up, click “Commit”.
    Type a message in “Commit message”, such as “Commit from RStudio”.
    Click “Commit”.

#### Push your local changes online to GitHub

Click the green “Push” button to send your local changes to GitHub. If you are challenged for username and password, provide them (but see below). You should see some message along these lines.

[master dc671f0] blah
 3 files changed, 22 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 myrepo.Rproj

#### Confirm the local change propagated to the GitHub remote

Go back to the browser. I assume we’re still viewing your new GitHub repo.

Refresh.

You should see the new “This is a line from RStudio” in the README.

If you click on “commits”, you should see one with the message “Commit from RStudio”.

If you have made it this far, you are DONE with set up. But first …

#### Were you challenged for GitHub username and password?

If you somehow haven’t done so yet, now is the perfect time to make sure you don’t need to keep providing username and password on each push.

First, make another small change locally and push again, to make sure we’ve given your system every opportunity to cache your credentials and retrieve them from the cache. It might “just work”.

Are you still challenged? Pick one:

    Credential caching for HTTPS access, chapter 10.
    Set up SSH keys, chapter 11.

Now is the perfect time to do this, since you have a functioning test repo.
