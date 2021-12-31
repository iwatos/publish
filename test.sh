find ./docs/publish -name '*.md' | while read file
do
    gsed -ie "s|\([ \n\r\f\t]\+\)\(#[^ \n\r\f\t]\+\)|\1\`\2\`|g" "${file}"
done