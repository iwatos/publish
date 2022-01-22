`<module-includes>:1:1: error: umbrella header for module 'GoogleDataTransport' does not include header 'GDTCORDataFuture.h' \[-Werror,-Wincomplete-umbrella\] #import "Headers/GoogleDataTransport-umbrella.h"`
みたいなエラーが出た時

```sh
cd ios
rm -rf Pods
flutter clean
flutter run # or AndroidStudioからデバッグビルド

```

---
# Related Notes
- 

# References
- https://qiita.com/shoukitsuda0310/items/a7377bae8075de7f95be

# Tags
- #flutter 