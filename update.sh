rm -rf ~/repos/publish/docs/
mkdir ~/repos/publish/docs/
cp -R ~/obsidian/private/publish/** ~/repos/publish/docs/
cp ~/repos/publish/README.md ~/repos/publish/docs/index.mkdir

find ./docs -name '*.md' | while read file
  do
    # 見出しレベルを一段階下げる（ページタイトルのみをh1にするため）
    gsed -i "s|# |## |g" "${file}"
  
    # ページタイトルの設定
    name=`basename "${file}" .md`
    gsed -i "1s|^|#\ ${name}\n|" "${file}"
  
    # タグのエスケープ（見出しと認識されてしまうため）
    gsed -i "s|\(#[^ #\n\r\f\t]\+\)|\`\1\`|g" "${file}"  
  done

git add -A &&
git commit -m "update"