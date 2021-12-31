find ./docs/publish -name '*.md' | while read file
do
    gsed -ie "s|\(#[^ \n\r\f\t]\+\)|\`\1\`|g" "${file}"
done