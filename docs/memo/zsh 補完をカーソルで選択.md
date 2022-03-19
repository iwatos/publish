更新日: {{ git_revision_date }}

# zsh 補完をカーソルで選択
`~/.zshrc`に以下を追記する。
```
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1
```


----
### Related Notes
- 

### References
- [Zsh 補完をカーソルで選択する](https://kaworu.jpn.org/kaworu/2012-04-17-1.php) 

### Tags
- 