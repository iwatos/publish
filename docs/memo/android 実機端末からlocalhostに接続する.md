# android 実機端末からlocalhostに接続する
1. PCのローカルサーバを起動 `http://localhost:3000`
2. AndroidをUSBでつなぐ。
3. PCのChromeを立ち上げ`chrome://inspect/`#devices`を開く。`
4. 「Port forwarding...」を開く。
5. `3000 / localhost:3000` を入力し、`Enable port forward` にチェックを入れDone
![[Pasted image 20220111201142.png]]

Androidから`http://localhost:3000`を叩き結果を取得できればOK

---
## Related Notes
- 

## References
- https://www.suzu6.net/posts/141-android-to-pc-localhost/

## Tags
- `#android`