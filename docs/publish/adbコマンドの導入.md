AndroidStudioを起動しメニューの
File > OtherSettings > Default Project Structure… を選択しSDKのパスを確認
基本的には`~/Library/Android/sdk/platform-tools`

# bashの場合
```sh
vim ~/.bash\_profile
# export PATH=$PATH:/Users/ユーザ名/Library/Android/sdk/platform-tools
# を追記
source ~/.bash\_profile
```

---
# References
- https://qiita.com/hyotty/items/2b1cd76525698064c73d

# Tags
- #android 