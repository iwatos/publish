# ServerlessFramework function毎にデプロイするファイルを指定する方法
1. package > individually を`true`に設定し、個別のfunctionのデプロイ対象設定を有効化
1. package > excelude で`./**(全ファイル)`　を設定し、全ファイルをデプロイ対象から除外
1. functions > 個別のfunction > package > include でデプロイしたいファイルを指定
1. zipファイルなどをデプロイしたい場合は functions > 個別のfunction > package > artifact で指定

```yml:serverless.yml
service: serverless-sample

frameworkVersion: '2'

package:
  individually: true ## 1
  exclude: ## 2
    - ./**

functions:
  hello:
    handler: src/hello/handler.hello
    events:
      - http:
          path: hello
          method: get
    package: ## 3
      include:
        - src/hello/**
  hello2: 
    handler: src/hello2/handler.hello2
    events:
      - http:
          path: hello2
          method: get
    package: ## 3
      artifact: dist/hello2.zip
```

## 参考
公式　https://www.serverless.com/framework/docs/providers/aws/guide/packaging/
