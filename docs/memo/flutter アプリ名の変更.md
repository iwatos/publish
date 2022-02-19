# flutter アプリ名の変更
## Android
`/android/app/src/main/AndroidManifest.xml`の`android:label`に名前を設定
```xml
<application 
    android:label="アプリ名">
```
## iOS
`/ios/Runner/Info.plist`の`CFBundleName`に名前を設定
```plist
<key>CFBundleName</key> 
<string>アプリ名</string>
```


---
### Related Notes
- 

### References
- https://algorithm.joho.info/flutter/flutter-apply-name/

### Tags
- `#flutter` 