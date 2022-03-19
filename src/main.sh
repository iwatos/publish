SCRIPT_PATH=`dirname $0`
poetry run python $SCRIPT_PATH/main.py
sh $SCRIPT_PATH/update.sh
git add -A
# git commit -m "update"
# git push
