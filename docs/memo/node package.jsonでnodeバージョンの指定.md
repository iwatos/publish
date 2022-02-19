# node package.jsonでnodeバージョンの指定
package.jsonにengines要素でノードバージョンを指定しておくと
`yarn install` または`npm install --engine-strict`実行時に
指定nodeではない場合は警告が出る

## 例
```json:package.json
{
  "name": "my-module",
  "version": "1.0.0",
  "main": "index.js",
  "license": "MIT",
  "engines": { "node": "12.x" } //ここで指定する
}
```

## References
[package.jsonに"engines"を設定すると「このバージョンのNode.jsでしか動かない」を表明できる - Qiita](https://qiita.com/suin/items/994458418c737cc9c3e8)

---
## Related Notes
- 

## References
- 

## Tags
- `#js` 