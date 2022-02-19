# flutter x86のアンドロイドエミュレータでビルドする
`rootDirectory/android/app/build.gradle`
の下記に `"x86", "x86_64"` を追記する。
```
android {
	defaultConfig {
		ndk {
			abiFilters "armeabi-v7a", "arm64-v8a", "x86", "x86_64" // ここに追記
		}
	}
}
```


追記していない場合 `libflutter.so not found` エラーが発生する

---
## Related Notes
- 

## References
- 

## Tags
- `#flutter` 