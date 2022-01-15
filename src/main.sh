SCRIPT_PATH=`dirname $0`

sh $SCRIPT_PATH/update.sh
   
git add -A
git commit -m "update"
poetry run python "$SCRIPT_PATH/src/history.py"
# git push