インストール

```sh
brew install anyenv
```


/Users/**/.config/fish/config.fish に以下を追記

```sh
set -x PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)
```

初期化

```sh
anyenv install --init
```
