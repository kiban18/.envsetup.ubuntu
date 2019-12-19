#!/bin/bash

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

git checkout master
git pull -p

LOCALS=`git branch | grep -wv master`
arr=($LOCALS)
for local in "${arr[@]}"
do
    if ! contains "$local" "master"
    then
        echo "git branch -D $local"
        git branch -D $local
    fi
done

REMOTES=`git branch -r`
echo "REMOTES: $REMOTES"
arr=($REMOTES)
for remote in "${arr[@]}"
do
    if contains "$remote" "origin"
    then
        if ! contains "$remote" "HEAD"
        then
            echo "git checkout -B ${remote#origin/} $remote"
            git checkout -B ${remote#origin/} $remote
        fi
    fi
done
git checkout master
