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

cp "$ROOT/README.md" "$DOCS/index.md"
cp -R "$ROOT/assets" "$DOCS/assets"

mkdir "$DOCS/attachments"
grep -rE "!\[\[.*.(png|jpg|jpeg|pdf)\]\]" "$DOCS/" | grep -oE "!\[\[.*.(png|jpg|jpeg|pdf)\]\]" | sed -e 's/!\[\[//g' -e  's/\]\]//g' | while read line
do
  cp "/Users/yt/obsidian/private/attachments/$line" "$DOCS/attachments/$line"
done