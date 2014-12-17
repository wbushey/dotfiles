#!/bin/bash

# This script checks for an hg push and then pushes to github too.

#post-push to github
if [[ $HG_ARGS = "push" ]]
then
    hg push github 
fi
