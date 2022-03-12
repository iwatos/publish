# Serverless Framework（AWS + Golang) 導入
公式のGettingStartedに従ってみる
https://www.serverless.com/framework/docs/getting-started
```
## インストール
node -v ## 16.14.0
yarn init
yarn add serverless
```

## プロジェクト作成
https://www.serverless.com/framework/docs/providers/aws/examples/hello-world/go
``` 
yarn run sls create --template aws-go-mod

## https://qiita.com/hisamitsu0723/items/00126651c8470e8aa874
go mod tidy
make build
```

## デプロイ
- [[aws cliのprofile設定ファイル]] の設定後
serverless.ymlにregionを記入
```yml
provider:
  name: aws
  runtime: go1.x
  region: ap-northeast-1
```

デプロイ
```
yarn run sls deploy
```

## 実行
```
yarn run sls invoke -f hello
yarn run sls invoke -f world
```

ともに200が返ってくればOK



----
### Related Notes
- 

### References
- 

### Tags
- `#golang` `#aws` `#serverless`