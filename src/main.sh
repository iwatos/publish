SCRIPT_PATH=`dirname $0`
sh $SCRIPT_PATH/update.sh
git add -A
git commit -m "update"
git push
