#!/usr/bin/env bash

#check the current branch we are on
currentBranch=$(git branch | grep \* | cut -d ' ' -f2)

#print the branch and wait for a continue

echo "currently on branch $currentBranch do you wish to continue with the release? (y/n)"
read  -n 1 -p "Input: " carryON


if [[ "$carryON" != "y" ]]
then
echo "
exiting"
exit
fi


#ask if a release branch is needs to be created

echo "
do you want a release branch created ? (y/n)"
read  -n 1 -p "Input: " carryON


if [[ "$carryON" == "y" ]]
then
echo "
what branch do you want?"
read  -p "Input: " branch
echo "
creating new branch $branch
"

git checkout -b ${branch}

if [[ $? > 0 ]]
then
exit "command failed" $?
fi

fi

#check we are upto date and no local changes
dirty=$(git ls-files -m | wc -l)
echo "$dirty"
if [[ ${dirty} > 0 ]]
then
echo "
 the local file system is dirty cannot continue
"
exit
fi


#update the manifest with the release tag

#commit the change and push

#tag and push

#commit the