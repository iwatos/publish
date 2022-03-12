# android 端末にインストールされてるapkファイルをダウンロードする
[[android CLIでインストールアプリ一覧を確認する]]からパッケージ名を取得
1. `adb shell pm path <パッケージ名>`でapkパスを取得
2. `adb pull <apkパス>`でapkをダウンロード（保存場所はカレントディレクトリ）

---
## References
- 

## Tags
- `#android` 