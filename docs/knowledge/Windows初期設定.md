# chocolatey
# インストール
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
# アプリインストール
```powershell
choco install googlechrome -y
choco install 1password -y
choco install dropbox -y
choco install steam-client -y
choco install line -y
choco install visualstudiocode -y
choco install jetbrainstoolbox -y
choco install discord -y
choco install hain -y
choco install git -y
```

一括でインストールする場合
https://pouhon.net/chocolatey-config/5472/

# WSLの設定
https://qiita.com/matarillo/items/61a9ead4bfe2868a0b86

管理者としてpower shell を実行
```powershell
# windows subsystems for linux の有効化
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# 仮想マシンのプラットフォームの有効化
Enable-WindowsOptionalFeature -online -featurename VirtualMachinePlatform

# PC再起動

# Linux カーネル更新プログラム パッケージをダウンロード
# https://docs.microsoft.com/ja-jp/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package

# WSLのデフォルトバージョンをWSL2に設定
wsl --set-default-version 2

# Microsoft StoreからUbuntuのインストール
# Ubuntuの起動 

# UbuntuをWSL2設定
wsl --set-version Ubuntu 2
wsl -l -v
```


# デバイス設定

# magic keyboard
https://www.vector.co.jp/soft/winnt/util/se228667.html
からkey swapをダウンロード
![[Pasted image 20210410001435.png]]
の設定をしてPC再起動
※ 有線でつながないと英数/かなキーが使用できない

# magic track pad 2
https://github.com/imbushuo/mac-precision-touchpad/releases
から`Drivers-amd64-ReleaseMSSigned.zip`をDL
展開後`AmtPtpDevice 2.inf`を右クリックしてインストール
成功すればシステム設定に「タッチパッド」の項目が追加されるので設定
※ 有線でつながないとうまく動作しない

---
# Related Notes
- 

# References
- 

# Tags
- #windows 