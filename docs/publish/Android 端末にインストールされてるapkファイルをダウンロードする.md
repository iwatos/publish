1. #android 

[[Android adb インストールアプリ一覧]]からパッケージ名を取得
2. `adb shell pm path <パッケージ名>`でapkパスを取得
3. `adb pull <apkパス>`でapkをダウンロード（保存場所はカレントディレクトリ）