# 参考
https://jp.vuejs.org/v2/cookbook/debugging-in-vscode.html
https://qiita.com/hashimoto-1202/items/c81f5d4c271eef16d957

# 環境
vue-cli(この記事では3.0以上)
VScode
Chrome または FireFox

# Debugger for Chrome/FireFox(VSCode拡張機能)
## インストール
以下リンク、またはVSCodeの拡張機能検索からインストール
[Debugger for Chrome](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome)
[Debugger for Firefox](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-firefox-debug)

インストール後、vue-cli3で作成したプロジェクトフォルダ直下に
vue.config.js を作成し以下を記述する。


```javascript:vue.config.js
module.exports = {
  configureWebpack: {
    devtool: 'source-map'
  }
}
```

VSCodeのデバッグビュー→歯車アイコンをクリックしlaunch.jsonファイルを開き
以下を記述する。
![スクリーンショット 2019-03-01 22.13.16.png](https://qiita-image-store.s3.amazonaws.com/0/230281/b5a94378-3bf0-b5c0-b17d-de85a371f3cd.png)


```json:launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "chrome",
      "request": "launch",
      "name": "vuejs: chrome",
      "url": "http://localhost:8080",
      "webRoot": "${workspaceFolder}/src",
      "breakOnLoad": true,
      "sourceMapPathOverrides": {
        "webpack:///./src/*": "${webRoot}/*"
      }
    },
    {
      "type": "firefox",
      "request": "launch",
      "name": "vuejs: firefox",
      "url": "http://localhost:8080",
      "webRoot": "${workspaceFolder}/src",
      "pathMappings": [{ "url": "webpack:///src/", "path": "${webRoot}/" }]
    }
  ]
}
```
## 機能
* F5(メニュー→Debbug→StartDebugging)でブラウザ起動とlocalhost:8080の表示
npm run serve などをあらかじめ動かしておく必要あり
![スクリーンショット 2019-03-01 22.06.02.png](https://qiita-image-store.s3.amazonaws.com/0/230281/7ace6995-8aa9-2fe6-3cb6-8fc14a4dcbe1.png)
起動ブラウザは左上でlaunch.jsonファイル記載のものが選択可能。
![スクリーンショット 2019-03-01 22.37.32.png](https://qiita-image-store.s3.amazonaws.com/0/230281/c9a30651-7bf0-513b-30db-54ac1456189f.png)


* ブレイクポイントの設定が可能
行番号の左をクリックしてブレイクポイント設定


# Vue Devtools(Chrome/FireFoxアドオン)
## インストール
以下リンク、またはブラウザのアドオン検索からインストール
[Vue.js devtools(Chrome)](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
[Vue.js devtools(FireFox)](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)

Chromeの場合インストール後に拡張器の設定を開き
「ファイルのURLへのアクセスを許可する」を有効にする。
![スクリーンショット 2019-03-01 22.33.01.png](https://qiita-image-store.s3.amazonaws.com/0/230281/b58ea459-52bf-0ed1-9e40-6c1e0a65509f.png)


## 機能
デベロッパーツールにvueタブが追加され
component内のデータなどが参照できる。
![スクリーンショット 2019-03-01 22.53.02.png](https://qiita-image-store.s3.amazonaws.com/0/230281/465340b8-7b1e-ccb2-bc83-edd299444109.png)
![スクリーンショット 2019-03-01 23.04.49.png](https://qiita-image-store.s3.amazonaws.com/0/230281/1810096e-9ba3-ba25-7c98-fba6cc5b9def.png)




