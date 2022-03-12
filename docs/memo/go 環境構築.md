# go 環境構築
`#golang`

## 手順
### goのインストール
```
brew install go
go versions
```
asdfを利用するとintelliJでうまくGOROOTを設定できない


### VScodeの設定
Go言語の拡張機能をインストールする
[[vscode コマンドパレット]]から`Developer: reload window`を実行
[[vscode コマンドパレット]]から`GO: Install/Update tools`を実行

### プロジェクトセットアップ
```sh
cd [プロジェクト直下]
go mod init [プロジェクト名]
```

main.goを作成
```go
package main

import "fmt"

func main() {
    fmt.Printf("Hello world\n")
}
```

VSCodeでF5から実行して`Hello world`が出れば成功

## intelliJ


## References
https://qiita.com/melty_go/items/c977ba594efcffc8b567