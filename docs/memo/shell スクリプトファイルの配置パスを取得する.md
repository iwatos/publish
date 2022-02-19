# shell スクリプトファイルの配置パスを取得する
```sh
## sh dev/work/relative.sh

echo $0
## => dev/work/test.sh （カレントディレクトリからの相対パス）

echo `dirname $0`
## => dev/work

echo `basename $0`
## => test.sh

```


---
## Related Notes
- 

## References
- https://www.task-notes.com/entry/20150214/1423882800

## Tags
- `#cli` 