更新日: {{ git_revision_date }}

# mac .DS_Storeを作成しない設定をする
下記コマンドを打つ
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores True
killall Finder
```

もとに戻す場合はFalseを指定
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores False
killall Finder
```

----
### Related Notes
- 

### References
- [Mac .DS_Store や ._xxx ファイルを作らない＆削除する方法 - loveMac.jp](https://lovemac.jp/9906)

### Tags
- 