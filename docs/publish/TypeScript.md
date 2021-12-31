
https://www.typescriptlang.org/docs/handbook/intro.html

https://book.yyts.org/

# json→型情報
`curl https://qiita.com/api/v2/schema | npx json2ts > qiita-types.d.ts`
http://json2ts.com/
https://www.npmjs.com/package/json2ts

# 型定義
- @types配下

# API取得
```ts
import axios from 'axios'
import { RootObject } from './@types/get'
 
axios
.get<RootObject\>('https://randomuser.me/api?callback=jsonData')
.then((res) \=> {
console.log(res.data)
})
.catch((e) \=> {
console.log(e)
})
```


---
# Related Notes
- 

# References
- 

# Tags
- #js