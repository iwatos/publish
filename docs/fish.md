# インストール
```sh
brew install fish
```

# デフォルトシェルをfishに変更

```sh
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

# プラグインマネージャ
# インストール
fisher

```sh
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

# おすすめプラグイン
```sh
# 見た目がかっこよくなる　情報も多い
fisher add oh-my-fish/theme-bobthefish

# 一度移動したディレクトリに曖昧検索で移動できる
fisher add jethrokuan/z

# 以前実行したコマンドを曖昧検索できる
fisher add jethrokuan/fzf
```

# IDE設定
# VSCode
赤枠でfishを選択
![[Pasted Image 2.png]]

# InteliJ
Preferences → Tools → Terminal → shell path
を`/usr/local/bin/fish`に設定
![[Pasted Image 3.png]]

# ~/.config/fish/config.fish
```

alias i='idea'
alias ii='idea .'
alias c='code'
alias cc='code .'
alias s='stduio'
alias ss='studio .'

alias cdd='cd ~/Desktop'
alias cdr='cd ~/repos'
alias cddl='cd ~/Downloads'

alias cf='code ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'

# git操作------------------------------------------------
alias g='git'
alias delete-merged-local-branch='git branch --merged|egrep -v "\*|develop|master"|xargs git branch -d'

function fgl -d "Fuzzy-find and copy a git log"
  git log --pretty=format:'%h %s' | fzf | pbcopy
end

function fbr -d "Fuzzy-find and checkout a branch"
  git branch | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result" && git pull
end

function fbrm -d "Fuzzy-find and checkout a branch"
  git fetch && \
  set -l selectedBranch (git branch --all | grep -v HEAD | grep -e " remotes/origin/*" | string trim | fzf | read -l result; and echo "$result") && \
  set -l convertedBranch (string replace remotes/origin/ "" "$selectedBranch") && \
  git checkout -b "$convertedBranch" origin/"$convertedBranch"
end

# エディタ起動------------------------------------------
function fi -d "intelijでリポジトリ開く"
  set -l selectedRepository (ls ~/repos | fzf| read -l result; and echo "$result")
  if test "$selectedRepository" != ""
    cd ~/repos/"$selectedRepository"
    idea ~/repos/"$selectedRepository"
  end
end

function fc -d "VSCodeでリポジトリ開く"
  set -l selectedRepository (ls ~/repos | fzf| read -l result; and echo "$result")
  if test "$selectedRepository" != ""
    cd ~/repos/"$selectedRepository"
    code ~/repos/"$selectedRepository"
  end
end

function fs -d "AndroidStudioでリポジトリ開く"
  set -l selectedRepository (ls ~/repos | fzf| read -l result; and echo "$result")
  if test "$selectedRepository" != ""
    cd ~/repos/"$selectedRepository"
    studio ~/repos/"$selectedRepository"
  end
end

function fr -d "カレントディレクトリをリポジトリルートに移動"
  set -l selectedRepository (ls ~/repos | fzf| read -l result; and echo "$result")
  if test "$selectedRepository" != ""
    cd ~/repos/"$selectedRepository"
  end
end

# fishパス操作--------------------------------
alias show_path='echo $fish_user_paths | tr " " "\n" | nl'

function add_path 
  set -Ux fish_user_paths $argv $fish_user_paths
end

function remove_path
  set --erase --universal fish_user_paths[$argv]
end

# 初期化-----------------------------------------
anyenv init - fish | source

```

---
# Related Notes
- 

# References
- 

# Tags
- #cli