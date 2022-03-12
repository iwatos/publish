# js 繰り返し処理
1秒ごとに繰り返す

## setInterval
```js
const intervalHandlerId = null
const makeLog = () => {
	console.log("interval")
}

intervalHandlerId = setInterval(makeLog, 1000) // 開始
clearInterval(intervalHandlerId) // 停止
```

## setTimeout
```js
const timeoutHandlerId = null
const makeLog = () => {
	console.log("timeout")
	intervalHandlerId = setTimeout(makeLog, 1000)
}

makeLog() // 開始
clearTimeout(timeoutHandlerId) // 停止
```



----
### Related Notes
- 

### References
- [JavaScriptでsetIntervalを使う方法【初心者向け】現役エンジニアが解説 | TechAcademyマガジン](https://techacademy.jp/magazine/5537)
- [JavaScriptでsetTimeoutを使う方法【初心者向け】現役エンジニアが解説 | TechAcademyマガジン](https://techacademy.jp/magazine/5541)
- 

### Tags
- 