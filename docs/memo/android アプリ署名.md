更新日: {{ git_revision_date }}

# android アプリ署名
```ad-warning
jksファイル、propertiesファイルはgitignoreしておくこと
```

jksファイルが生成されるのでリポジトリに配置する。
## アップロード鍵の生成
https://developer.android.com/studio/publish/app-signing?hl=ja`#generate-key`
を参照
jksファイルが生成されるのでリポジトリに配置する。

## 認証設定
android/app/build.gradleに以下を設定
```gradle
android { 
	signingConfigs {  
	 release {  
	 storeFile file('../keystore.jks')  
	 storePassword KEYSTORE_STORE_PASSWORD  
			keyAlias KEYSTORE_KEY_ALIAS  
			keyPassword KEYSTORE_KEY_PASSWORD  
		}  
	}  

	buildTypes {  
	 release {  
	 signingConfig signingConfigs.release  
			debuggable false  
	 }  
	}
}
```

KEYSTORE_STORE_PASSWORD
KEYSTORE_KEY_ALIAS 
KEYSTORE_KEY_PASSWORD 
はアップロード鍵生成で設定した値にする。


propertiesファイルを作成しておき、それを読み込むようにするとよい
```properties:keystore.properties
STORE_PASSWORD=XXXX
KEY_ALIAS=XXX
KEY_PASSWORD=XXX
```

```gradle:build.gradle
def KEYSTORE_STORE_PASSWORD =''  
def KEYSTORE_KEY_ALIAS = ''  
def KEYSTORE_KEY_PASSWORD = ''  
def keyStorePropertiesFile = rootProject.file('keystore.properties')  
if (keyStorePropertiesFile.exists()) {  
 keyStorePropertiesFile.withReader('UTF-8') { reader ->  
        def keyStoreProperties = new Properties()  
 keyStoreProperties.load(reader)  
  
 KEYSTORE_STORE_PASSWORD = keyStoreProperties.getProperty('STORE_PASSWORD')  
 KEYSTORE_KEY_ALIAS = keyStoreProperties.getProperty('KEY_ALIAS')  
 KEYSTORE_KEY_PASSWORD = keyStoreProperties.getProperty('KEY_PASSWORD')  
 }} else {  
 throw new GradleException("ローカルでビルドする場合は/android/keystore.propertiesが必要です。")  
}
```

----
### Related Notes
- 

### References
- https://developer.android.com/studio/publish/app-signing?hl=ja`#generate-key`

### Tags
- `#android` 