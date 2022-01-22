fishのPATH登録はbashやzshと異なるので注意

# PATHの登録
ターミナルにて以下のコマンドを一回打てばOK

```sh
$ set -Ux fish_user_paths （登録したいPATH スペース区切りで複数登録可能） $fish_user_paths
```

もし`~/.config/fish/config.fish`
に記述している場合、fishシェルを起動するたびにPATH登録がされてしまう。
そのままにするとPATHが長すぎて起動時にエラーが発生するようになるので以下の対応を行う。

# PATHの確認
以下のコマンドを打つとindex付きで出力される

```sh

$ echo $fish_user_paths | tr " " "\n" | nl
#     1	/user/local/.anyenv/bin
#     2	/user/local/bin
#     3 /user/local/bin
```

# PATHの削除
先ほど確認した登録PATHのindexを指定して、以下のコマンドを打つ
`消したいPATHのindex`については`2..20`のように範囲指定も可能

```sh
$ set --erase --universal fish_user_paths[（消したいPATHのindex）]
```

# エイリアス
上記操作用のエイリアスです。
`~/.config/fish/config.fish`に下記を追記すればコマンドで使えます。

```sh
function set_path
  set -Ux fish_user_paths $argv $fish_user_paths
end

alias path_list='echo $fish_user_paths | tr " " "\n" | nl'
 
function remove_path
  set --erase --universal fish_user_paths[$argv]
end
 
# 使用例
# $ set_path /user/local/bin
# $ path_list
# $ remove_path 1
```

# 参考
https://qiita.com/mochizukikotaro/items/0beae50b2a20f93e496d
