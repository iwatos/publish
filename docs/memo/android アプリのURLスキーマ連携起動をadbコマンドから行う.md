更新日: {{ git_revision_date }}

# android アプリのURLスキーマ連携起動をadbコマンドから行う
AndroidをUSB接続している状態で以下コマンドを実行する
（URL、パラメータは適宜変更）
```sh
adb shell 'am start -a android.intent.action.VIEW -d "samplepp://jp.co.hoge/fuga?param=aaaa"'
[adb shell 'am start -a android.intent.action.VIEW -d "samplepp://jp.co.hoge/fuga?param=aaaa"'](<adb shell 'am start -a android.intent.action.VIEW -d "samplepp://jp.co.hoge/fuga?param=aaaa"'>)
```

---
## References
- 

## Tags
- `#android` 