# dart DateTimeの利用方法まとめ
## Dart
[フォーマッタ書式コード]()
### 現在時刻でdatetime生成
```dart
DateTime.now();
```
### 指定時刻でdatetime生成
```dart
DateTime.utc(1989, 11, 9);
```
### datetime → str(ISO形式)
```dart
DateTime.now().toIso8601String();
```
### datetime → str(指定形式)
```dart
DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP").format(DateTime.now()) ;
```
[DateFormat形式](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html)
### str → datetime (ISO形式)
```dart
DateTime.parse('2019-04-30 10:48:27.701406');
```
[parseの受け取り形式](https://api.flutter.dev/flutter/dart-core/DateTime/parse.html)
### str → datetime (指定形式)
```dart
DateFormat('EEE, d MMM yyyy HH:mm:ss Z').paese('Tue, 18 Sep 2018 11:30:15 +0000');
```
