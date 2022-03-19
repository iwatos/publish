RELATIVE_ROOT="`dirname $0`/.."
ROOT=`realpath "$RELATIVE_ROOT"`
DOCS="${ROOT}/docs"

cp "$ROOT/README.md" "$DOCS/index.md"
cp -R "$ROOT/assets" "$DOCS/assets"

# 画像の用意
mkdir "$DOCS/attachments"
grep -rE "!\[\[.*.(png|jpg|jpeg|pdf)\]\]" "$DOCS/" | grep -oE "!\[\[.*.(png|jpg|jpeg|pdf)\]\]" | sed -e 's/!\[\[//g' -e  's/\]\]//g' | while read line
do
  cp "/Users/yt/Dropbox/obsidian/attachments/$line" "$DOCS/attachments/$line"
done