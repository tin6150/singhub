
git branch merge lesson learned
*******************************


i followed this
https://stackoverflow.com/questions/14168677/merge-development-branch-with-master

to merge.
ie, 
both branch up to date locally by reapeatedly

.. code: 

	git checkout vagrant_package_platform_independent
	git checkout master

the "accepted answer" says to 
	I generally like to merge master into the development first so that if there are any conflicts, I can resolve in the development branch itself and my master remains clean.

so, while i was on the master branch, i did

.. code:

	git merge vagrant_package_platform_independent

then did
git mergetool
to resolve conflicts (mostly resolved automatically, only 1 change had to edit by hand).
(this was done on cueball, mergetool was gvimdiff).

normal git commit didn't work.
had to use -i that supposed to create an extra staging point:
https://stackoverflow.com/questions/5827944/git-error-on-commit-after-merge-fatal-cannot-do-a-partial-commit-during-a-mer


anyway, my complain is that this seems to have really merged code into master brannch.
the "dev" branch was collapsed.
I thought I would merge in the dev branch, see that all is okay, the push it back to master.
maybe the `--no-ff` flag for merge would have done mostly what I do.

git-scm "book" suggest the same process as stated in stack overflow, so i guess it is the way to go.
https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging


PS.
the merge I did left the pre-merge files behind, eg:
	vboxguestaddition.tmp.txt.orig
	virtualbox-guest/tasks/main.yml.orig
they are not added to git, just stays on the local machine where merge was done.  
will delete them after I know my stuff works.


