# vscode vimを利用する
## プラグインをインストール
Vimプラグインをインストールする
![[Pasted image 20220103002040.png]]

## setting.jsonに設定を追記
[[vscode settings.json]]に以下を追記
```json
{
	"vim.vimrc.enable": true,
    "vim.vimrc.path": "~/.vimrc",
}

```


なお[vimrcの設定適用はまだ不完全](https://github.com/VSCodeVim/Vim`#vimrc-support)なため、リマッピング設定のみしか適用されない`
`jj`でinsertモード解除設定を追加したい場合は以下も追記
```
  "vim.insertModeKeyBindings": [
    {
        "before": ["j","j"],
        "after": ["<Esc>"]
    }
  ]
```

---
## Related Notes
- 

## References
- https://www.pc-gear.com/post/vscode-vim-vimrc/

## Tags
- `#vscode` 