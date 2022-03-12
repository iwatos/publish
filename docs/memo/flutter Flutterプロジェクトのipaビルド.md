# flutter Flutterプロジェクトのipaビルド
[[ios AppStore用証明書の作成]]
で
`test.mobileprovision`, `証明書.p12`を用意してダブルクリック

xcodeでios/Runnerを開く

provisioning file
bundleID
を設定
![[Pasted image 20220125195301.png]]

AppleDistributionを利用するつもりなのにiOS Distributionがみつからないと言われたときは
BuildSetting > Code Signing Identity で
iOS Distributionとなっている部分をAppleDistributionに変更


メニュー > Product > Build を実行

ここからデバイスをAny IOSに変換
![[Pasted image 20220125194957.png]]

デバイス選択欄の左からビルド環境を指定
![[image (1).png]]

メニュー > Product > Archive を実行

ウィンドウが出てくるのでDistribute Appを選択
（ウィンドウを閉じてしまったらメニュー >Window>Organizerから開く）
![[Pasted image 20220125195435.png]]

AppStoreConnect
Export
何もチェック変えずにNext
Profile選択してNext
Export

---
### Related Notes
- 

### References
- https://dev.classmethod.jp/articles/xcode-no-signing-certificate-ios-development-found-error/

### Tags
- `#ios` 