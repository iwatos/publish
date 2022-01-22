ファイル保存時にリンターやフォーマッターを実行させたい時に便利です。
参考:[blackとpylintを使った快適なPython開発](https://qiita.com/navitime_tech/items/0a431a2d74c156d0bda2)



## File Watchersのインストール
Preferences > Plugins
からFile Watchersをインストールする（インストール後にintelijの再起動が必要）

![スクリーンショット 2020-09-16 23.13.05.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/cc84a55e-e2d7-1baa-bbbf-095d22164e50.png)

## File Watchersの設定
Preferences > Tools > File Watchers
`+` > `<custom>`　からファイル保存時に実行したいコマンドを追加できる
![スクリーンショット 2020-09-16 23.17.33.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/dde0242e-1824-e5c1-02e5-ff96b6ed7a7e.png)

開いたWindowに実行したいコマンドを入力してOKを押せば保存される

|項目名|説明|
|---|---|
|Name|任意の名前|
|FileType|どの拡張子ファイルを保存した時にコマンドを実行するか|
|Scope|基本的にCurrentFIleでOK|
|Program|実行したいコマンドの最初のワード|
|Arguments|実行したいコマンドの二つ目以降のワード|
|Working directory|コマンドを実行する際のカレントディレトリ|
|Advanced Options|自動保存時にもコマンドを実行するかなど　チェックを外しておくのが無難|

以下はPythonファイル保存時にpoetryでpylintを実行する場合の例
![スクリーンショット 2020-09-16 23.26.54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/600a9859-9fa1-a4b7-6010-3b9379a75c47.png)

`$FilePath$`は保存したファイルのパスのマクロ
`$FileDir$`は保存したファイルののディレクトリパスのマクロ
入力欄の`+`からマクロ一覧が見れる
![スクリーンショット 2020-09-16 23.34.45.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/9fde8c14-05c4-8b19-fe76-41eb1fe10061.png)

## プロジェクト間での設定の共有
複数のリポジトリで使いたい時はLevelをGlobalに設定すると、
他のプロジェクトでもFile Watchers設定画面で表示される
デフォルトでEnabledのチェックは外れてるので使用したい場合はチェックを入れる必要あり
![スクリーンショット 2020-09-16 23.35.42.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/56e93ea1-ac5f-b255-833b-ceeb4719f998.png)

