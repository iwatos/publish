# インストール
````bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
````
https://brew.sh/index_ja

# Brewfile作成
以前のPC設定を引き継ぎたい場合は 
```bash
brew bundle dump --global --force
```
で `~/.Brewfile`が作成される。

作成されたファイル例
```Brewfile
tap "dart-lang/dart"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
brew "anyenv"
brew "awscli"
brew "ffmpeg"
brew "fish"
brew "fzf"
brew "gh"
brew "ghq"
brew "git"
brew "mas"
brew "poetry"
brew "python@3.8"
brew "yarn"
brew "dart-lang/dart/dart"
cask "1password"
cask "alfred"
cask "authy"
cask "avira-antivirus"
cask "bettertouchtool"
cask "dash"
cask "day-o"
cask "discord"
cask "docker"
cask "dropbox"
cask "evernote"
cask "google-chrome"
cask "google-japanese-ime"
cask "intellij-idea"
cask "iterm2"
cask "jetbrains-toolbox"
cask "spectacle"
cask "steam"
cask "unity-hub"
cask "visual-studio-code"
cask "stay"
mas "Kindle", id: 405399194
mas "LINE", id: 539883307
mas "Trello", id: 1278508951
mas "Lightshot Screenshot", id: 526298438
```

# PC間のBrewFile移動
前のパソコンからiCloudに配置
```bash
cp ~/.Brewfile ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/.Brewfile
```

iCloudから新しいPCに配置
```bash
cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/.Brewfile ~/.Brewfile 
```

# インストール実行
```bash
brew bundle --global
```
Brewfileに記載のインストールされる

---
# Related Notes
- 

# References
- 

# Tags
- #cli #macos 