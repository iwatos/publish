下記のリポジトリを利用してgithub Pagesで公開する
https://github.com/jobindj/obsidian-publish-mkdocs


```sh
cd ~/repos/publish &&
rm -rf ~/repos/publish/docs/publish &&
mkdir -rf ~/repos/publish/docs/publish &&
mkdir -rf ~/repos/publish/docs/publish/attachments &&
cp -r ~/obsidian/private/publish/* ~/repos/publish2/docs/publish &&
git add -A &&
git commit -m "update" &&
git push
```



# References
- 

# Tags
- #tool 