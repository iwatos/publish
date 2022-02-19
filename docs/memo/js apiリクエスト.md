# js apiリクエスト
```js
const url = "https://hoge.fuga"
const request = new XMLHttpRequest();

request.open('GET', url, true, 'basic認証ID', 'basic認証PW');
request.responseType = 'json';

request.onload = function () {
  var data = this.response;
  console.log(data);
};

request.send();
```

---
## Related Notes
- 

## References
- 

## Tags
- `#js`