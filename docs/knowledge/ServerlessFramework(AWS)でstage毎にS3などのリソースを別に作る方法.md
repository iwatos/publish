provider > stage: `${opt:stage, self:custom.defaultStage}`
custom > defaultStage: `dev` 
custom > resourcePrefix : `${self:provider.stage}`を使った値
と設定して
BucketNameを `${self:custom.resourcePrefix}-resource`とする

```yml:serverles..yml
service: serverless-sample

frameworkVersion: '2'

provider:
  name: aws
  runtime: python3.8
  stage: ${opt:stage, self:custom.defaultStage} 
  region: ${opt:provider, self:custom.defaultRegion}

custom:
  author: iwato
  defaultStage: dev
  defaultRegion: ap-northeast-1
  resourcePrefix: ${self:custom.author}-${self:service}-${self:provider.stage}
  environment:
    dev: # 開発環境
      key: dev-value
    test: # テスト環境
      key: test-value
    staging: # 検証環境
      key: staging-value
    prod: # 本番環境
      prod: prod-value

resources:
  Resources:
    NewResource:
      Type: AWS::S3::Bucket
      Properties:
        BucketName: ${self:custom.resourcePrefix}-resource
  Outputs:
     NewOutput:
       Description: "Description for the output"
       Value: "Some output value"
