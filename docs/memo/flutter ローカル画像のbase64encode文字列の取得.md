# flutter ローカル画像のbase64encode文字列の取得
```dart
Future _base64encodeImage(AssetGenImage image) async {
  final icomImage = await rootBundle.load(image.path);
  return base64Encode(icomImage.buffer.asUint8List());
}

```

---
## Related Notes
- 

## References
- 

## Tags
- `#flutter` 