find ./docs/publish -name '*.md' | while read file
do
    name=`basename "${file}" .md`
    sed -i "1s|^|#\ ${name}\n|" "${file}"
done