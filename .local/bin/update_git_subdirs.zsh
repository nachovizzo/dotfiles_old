# !/usr/bin/zsh
PWD=$(pwd)
DIRS=$(ls -d *)
echo "Updating all the sub-repositories we find in $PWD"
for repo in $DIRS
do
    if [ -d $repo/.git ]; then
      echo "Updating git repository found in $repo ..."
      cd $repo
      git pull
      cd ../
    fi;
done
echo "done"


