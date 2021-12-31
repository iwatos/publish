find ./docs/publish '*.md' | while read file
do
    name=`basename "${file}" .md`
    sed -i "" "1s|^|#\ ${name}\n|" "${file}"
done