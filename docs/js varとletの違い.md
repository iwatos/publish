# js varとletの違い
## スコープ
varは関数スコープ
letはブロックスコープ
```js
// var
function() {
  if (true) {
  	let foo = 'foo'
    var bar = 'bar';
  }
  console.log(foo); // 参照できない
  console.log(bar); // 参照できる
}();
```

---
## Related Notes
- 

## References
- 

## Tags
- `#js` 