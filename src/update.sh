RELATIVE_ROOT="`dirname $0`/.."
ROOT=`realpath "$RELATIVE_ROOT"`
DOCS="${ROOT}/docs"

rm -rf $DOCS
mkdir $DOCS
cp -R ~/obsidian/private/publish/** $DOCS

find $DOCS -name '*.md' | while read file
  do
    # 見出しレベルを一段階下げる（ページタイトルのみをh1にするため）
    gsed -i "s|# |## |g" "${file}"
  
    # ページタイトルの設定
    name=`basename "${file}" .md`
    gsed -i "1s|^|#\ ${name}\n|" "${file}"
  
    # タグのエスケープ（見出しと認識されてしまうため）
    gsed -i "s|\([ \n\r\f\t]\)#\([^ #\n\r\f\t]\+\)|\1\`\2\`|g" "${file}"  
  done

poetry run python "$ROOT/src/history.py"   

cp -R "$ROOT/assets" "$DOCS/assets"