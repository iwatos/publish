# flutter logger
[simple_logger](https://pub.dev/packages/simple_logger)がおすすめ

下記ファイルを作成し
```dart:logger.dart
final isDevlop = true // 環境判別用変数
final logger = SimpleLogger()
  ..setLevel(
    isDevelop ? Level.FINEST : Level.OFF, // 適当なレベルを設定
    includeCallerInfo: isDevelop, // リリースビルドではfalseにする
  )..onLogged = (log, info) {
    if (info.level >= Level.SEVERE) { // 適当なレベルを設定
      // Crashlyticsにエラーを送る。
    }
  };
```

下記のように使う
```dart
logger.info('hello logger!')
```

---
## Related Notes
- 

## References
- https://medium.com/flutter-jp/logger-ec25d8dd179a

## Tags
- `#flutter`