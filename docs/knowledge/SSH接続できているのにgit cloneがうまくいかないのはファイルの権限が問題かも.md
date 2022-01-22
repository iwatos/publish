git clone
を実行した時に

```terminal
$ git clone
fatal: could not create work tree dir '***': Permission denied
```
と表示されてしまう。
一番怪しいのはSSH接続がうまくいってないパターンなので確認。

```terminal
$ ssh -T git@github.com
Hi ***! You've successfully authenticated, but GitHub does not provide shell access.
```

繋がっているようだ。
調べてみるとフォルダの権限が違うユーザ等になっているとcloneできないみたい。
以下コマンドで権限を変更。

```terminal
chown 【ユーザ名】 【cloneで配置するフォルダ】
```

もう一度clone

```terminal
$ git clone
```

でうまくできた。




