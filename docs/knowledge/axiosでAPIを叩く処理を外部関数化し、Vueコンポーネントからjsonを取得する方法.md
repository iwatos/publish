# axiosでAPIを叩く処理を外部関数化し、Vueコンポーネントからjsonを取得する方法
#概要
axios.get.thenでAPIを呼びjsonを取得する関数を作成しようとしたが、
axiosは非同期処理のためreturnでjsonを返すことができなかった。
callback関数を用いることでjsonを取得できる。

#やり方
以下のjsファイルを作成

```js:Api.js
import axios from "axios"

function callApi(url, callback) {
  console.log()
  axios
    .get(url, { /*オプションがあれば書く*/ })
    .then(response => {
      callback(response)
    })
    .catch(e => {
      console.log("Error occurred in API")
      console.log(e)
    });
}

export default {callFreadApi}
```

Vueコンポーネントからの呼び出しは以下

```vue:component.vue
<template>
  <p>{{ info }}</p>
</template>

<script>
import Api from "./Api"

export default {
  name: "Component",
  components: { Api },
  data() {
    return {
      info: ""
    }
  },
  methods: {
    setInfo: function(info){
      this.info = info
    },
    callApi(url){
      Api.callApi(url, this.setInfo)
    }
  },
  mounted() {
    this.callApi("呼びたいAPIのURL")
  }
};
</script>

<style>
</style>
```
上記コンポーネントからcallApiを呼ぶことでjson結果を取得できる。
流れとしては
1. コンポーネントにApi.jsをインポートする。
2. Api.jsからcallApiを呼び出す。
3. callApiのなかでjson結果を取得し、コールバック関数（上記例ではsetInfo）に渡す。
4. setInfoでVueコンポーネントのdataにjson結果を代入する。
5. コンポーネントでjson結果が扱える。

