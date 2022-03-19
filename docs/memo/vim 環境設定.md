更新日: {{ git_revision_date }}

# vim 環境設定
## 設定ファイルの作成
### vimrc
vimの操作設定を記述するファイル

ファイルを作成
```sh
touch ~/.vimrc  
```

[[vim vimrc設定]]の内容を記入する

[Vimでの日本語編集がはかどるキーマッピング - Qiita](https://qiita.com/ssh0/items/9e7f0d8b8f033183dd0b)の内容も適宜追加する

### gvimrc
GUI vim（見た目）の設定を書くファイル
ファイルを作成
```sh
touch ~/.gvimrc  
```

以下の内容を記入[^1]
```
" ウィンドウの縦幅
set lines=55
" ウィンドウの横幅
set columns=180
" カラースキーム
colorscheme koehler
" ダーク系のカラースキームを使う
set background=dark
```

## エディター設定
### [[JetBrains]]
[[jetbrains vimを利用]]

### [[VSCode]]
[[vscode vimを利用する]]


---
## Related Notes
- [[vim コマンド一覧]]

## References
- 

## Tags
- `#vim` 