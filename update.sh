rm -rf ~/repos/publish/docs/ &&
mkdir ~/repos/publish/docs/ &&
cp -R ~/obsidian/private/publish/** ~/repos/publish/docs/ &&
cp ~/repos/publish/README.md ~/repos/publish/docs/index.md &&
git add -A &&
git commit -m "update"