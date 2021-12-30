# 手順
## goのインストール
[[asdf プラグインのインストール]]からgoをインストール
```sh
asdf plugin add golang
asdf golang install latest
asdf global golang latest
```


## VScodeの設定
Go言語の拡張機能をインストールする
[[vscode コマンドパレット]]から`Developer: reload window`を実行
[[vscode コマンドパレット]]から`GO: Install/Update tools`を実行

## プロジェクトセットアップ
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

---
# Related Notes
- 

# References
- https://qiita.com/melty_go/items/c977ba594efcffc8b567

# Tags
- #golang 