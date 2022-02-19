# flutter アプリアイコンを設定
```ad-note
iOSは透明度のあるアイコンを使えない（ストアアップロード時にエラーになる）
```

アイコンのpngファイルを任意の場所に設定

`flutter pub add --dev flutter_launcher_icons`を実行

pubspec.ymlに以下を追記
```yml
flutter_icons:
  android: true
  ios: true
  image_path: "lib/assets/icon.png"
```

`flutter pub pub run flutter_launcher_icons:main`を実行

---
### Related Notes
- 

### References
- https://zenn.dev/kyo9bo/articles/196e949cc9dd3a

### Tags
- `#flutter`