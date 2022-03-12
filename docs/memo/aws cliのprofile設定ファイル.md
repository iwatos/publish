# aws cliのprofile設定ファイル
AWS CLIを利用する場合に設定が必要。

## Credential
`~/.aws/credentials`
```credential
[default]
aws_access_key_id=XXXXXXXXXX
aws_secret_access_key=XXXXXXXXX
```

## Config
`~/.aws/config`
```
[default]
region=ap-northeast-1
output=json
```

`aws configure`コマンドでも設定可能

----
### Related Notes
- 

### References
- https://docs.aws.amazon.com/sdkref/latest/guide/file-location.html
- https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-configure-files.html

### Tags
- `#aws`