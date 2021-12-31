# anyenvの導入
## インストールと初期化
```bash
## install
brew install anyenv

## shellに設定追加(zsh)
echo 'eval "$(anyenv init -)"' \>> ~/.zshrc

## shellに設定追加(fish)
echo 'anyenv init - fish | source' >> ~/.config/fish/config.fish

## terminalを再起動
exec $SHELL -l

## 初期化
anyenv install --init
```

## plugin
## anyenv-update
```bash
## インストール
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update

## 各envのアップデート
anyenv update
```


---
## Related Note
- [[nodenv]]
- [[pyenv]]

## References
- https://qiita.com/rinpa/items/81766cd6a7b23dea9f3c

## Tags
- `cli` 