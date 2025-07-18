#!/bin/bash


git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push    origin master 
git push    gitee 
git push    atomgit
git push    github


