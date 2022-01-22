# GASってなに？
GASとはGoogle Apps Scriptの略称で、Googleが提供しているJavaScriptをベースにした言語です。
https://workspace.google.co.jp/intl/ja/products/apps-script/

Googleが提供している G Suiteサービス（ドキュメント、スライド、スプレッドシート、フォーム、カレンダーなど）の操作が可能です。
さらにブラウザ内で動作するエディタとそれらが動くサーバも（制限はありますが）無料で利用できます

# なぜGASでAPIを作るのか
最近はAPIを作ろうと思った場合にいろんな選択肢があります。
レンタルサーバを利用する、Herokuなどのサーバ上にAPIを構築する、AWSやGCPなどのクラウドコンピューティングを利用する、といったものが挙げられますがGASを使ってAPIを作る場合のメリットデメリットとしては以下があります。

## メリット
- サーバー料金がかからない
- G Suiteサービス（ドキュメント、スライド、スプレッドシート、フォーム、カレンダーなど）の操作ができる
- Javascriptを動作させるための環境構築が不要

## デメリット
- Javascriptとは別にGAS特有の仕様を覚えなければいけない
- 利用に様々な制限がある（https://developers.google.com/apps-script/guides/services/quotas）
- npmに非対応

# どんなものがGASに向いてるの？
メリットに書いたようにGASは手軽にすぐにできるのが売りですが、一方で複雑な処理や大規模な開発には向いてません。
また、認証周りなどの仕様や制限がいつどう変わるかもわからないといった懸念があります。
なので、以下の条件を満たすかどうかでGASを利用するかを決めましょう。
- G Suiteサービスの操作が必要
- 無料で利用をしたい
- 小規模なコード量
- 急に使えなくなってもなんとかなる

---

# ローカルプロジェクト作成
## ディレクトリの作成
プロジェクト用ディレクトリ名: `gas-project-directory`
プロジェクト名: `gas-project`
として説明を進めます。適宜自分のプロジェクトに合わせて変更してください。

まずGASプロジェクト用のディレクトリを作成します
```shell
mkdir gas-project-directory
cd gas-project-directory
```

## git導入
ローカルでGASを開発する理由の一つはバージョン管理をしたいからです。
ということでgitを導入します
```sh
git init
```

また環境構築をしていく過程で、認証情報やビルド成果物などのpushしたくないファイルが出てくる予定です。
先にプロジェクト直下に以下の`.gitignore`を作成しておきましょう。
```sh
touch .gitignore
```

```sh:gitignore
dist/**
node_modules/**
.clasp.json
.clasprc.json
creds.json
client_secret_*.apps.googleusercontent.com.json
```

## yarn導入
TypeScriptや、GASローカル開発に使うClaspというものを利用するのにyarnを使います。
npmを利用したい方は、本記事中のyarnコマンドをnpmに置き換えてください。
```sh
yarn init
# yarn init v1.22.4
# question name (gas-project-directory): gas-project 
# question version (1.0.0): 
# question description: 
# question entry point (index.js): 
# question repository url: 
# question author: 
# question license (MIT): 
# uestion private: 
# success Saved package.json
# ✨  Done in 9.14s.
```
package.jsonが作成されていればOKです。


# TypeScript環境構築
## TypeScript導入
以下コマンドでtypescriptを入れます
```sh
yarn add typescript
```

 `tsconfig.json` をプロジェクト直下に作成します。
こちらの設定に詳しい方はご自由に内容を変更しても大丈夫です。
```json:tsconfig.json
{
    "inlude": [
        "src/**/*"
    ],
    "compilerOptions": {
        "target": "ES2015",
        "module": "commonjs",
        "allowJs": false,
        "outDir": "./dist",
        "strict": true,   /* Enable all strict type-checking options. */
        "skipLibCheck": true
    }
}
```

プロジェクト用ディレクトリの直下にソースコード`src`ディレクトリを作成し、
その配下に`main.ts`ファイルとしてhelloworldのコードを配置します。
```ts:src/main.ts
console.log("hello gas world!!")
```

次にTypeScriptのコンパイルが成功するか確認します
```sh
yarn run tsc
```

distフォルダとmain.jsファイルが作成されていればコンパイル成功です。
念の為動作を確認します
```sh
node dist/main.js
```
「hello gas world!!」 と出ればOKです

## ESLint、prettier導入
ESLintはリンター（コードを解析して直すべき部分を指摘してくれる）、
prettierはフォーマッター（コードを整形してくれる）です。
便利なので入れましょう。

以下コマンドでESLintとperettierを入れます。
TypeScriptへの対応や、ESLintとperettierを併用する際にひつようなモジュールも含めています。
```sh
yarn add eslint prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-prettier
```

以下の`.eslintrc.json` `.prettierrc.json` をディレクトリ直下に作成します。
こちらの設定に詳しい方はご自由に内容を変更しても大丈夫です。
```json:.eslintrc.json
{
  "root": true,
  "parser": "@typescript-eslint/parser",
  "plugins": [
    "@typescript-eslint"
  ],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier",
    "prettier/@typescript-eslint"
  ]
}
```
```json:.prettierrc.json
{
  "trailingComma": "es5",
  "tabWidth": 4,
  "semi": false,
  "singleQuote": true
}
```

設定ファイルを作成したら、ESlintとprettierがそれぞれ動作することをコマンドで確認します。
```sh
yarn run prettier './src/**/*.{js,ts}'
yarn run eslint './src/**/*.{js,ts}'
```
ESLint、prettier導入もこれで完了です。

ESLint、prettierで自動でコードを整形してくれるコマンドが便利なので、
簡単に実行しやすいようにpackage.jsonにscriptコマンドを追加しておきましょう
```diff json:package.json
{
+  "scripts": {
+    "lintfix": "prettier --write './src/**/*.{js,ts}' && eslint --fix './src/**/*.{js,ts}'",
+  },
}
```

# clasp導入
GASをローカルで開発するためのモジュール`clasp`をインストールします。
```sh
yarn install clasp -g
```
グローバル環境を汚したくない方は`-g`オプションを外してください。
その場合本記事中の`clasp`コマンドは`yarn run clasp`に読み替えてください。

---


# GASプロジェクトの作成
## プロジェクト作成
claspを利用してプロジェクトを新規作成します

まずは下記コマンドでGoogleアカウント連携をおこないます。
ブラウザ認証画面が表示されますのでGoogleアカウントで認証してください。
また以降の作業はここで認証したアカウントで作業してください。
```sh
clasp login 
```

次にプロジェクト作成をおこないます。
```sh
clasp create gas-project
# standalone, api, sheet, doc など初期テンプレートをどれにするか聞かれるのでstandaloneを選ぶ
```
実行後にディレクトリ直下に　`.clasp.json` `appscript.json` が作成されます。

## プロジェクトの確認
GASプロジェクトが本当にGoogleサービス上で作成されてるかを以下コマンドで確認します。
ブラウザでGASエディター画面が開いて、プロジェクト名が左上に書いてあればOKです。
```
clasp open
```

こちらのリンクでも、GASプロジェクト一覧が確認できます。
https://script.google.com/home


# push設定
ローカルのファイルをGASサーバ上にpushするときの、対象ファイルを設定します。
今回はTypeScriptのコンパイルで生成したdistフォルダをGASサーバにプッシュするための設定をします。

実はGASはtypescriptの状態でpushをしても自動でjsにコンパイルしてプッシュしてくれるのですが、それだとtsconfigのコンパイル設定が適用できないため、ローカルでjsコンパイルをした結果のdistフォルダをプッシュするようにします

まず`.clasp.json`にdistフォルダをpush対象とする設定を追加します
```diff json:.clasp.json
{
  "scriptId": "<固有のスクリプトID>"
+ "rootDir": "dist"
}
```

push対象の中には`appscript.json`を含める必要があるため、毎回`appscript.json`も`dist`フォルダに配置する必要があります。
コンパイル時に毎回配置するコマンドを打つのは面倒なので`package.json`にてコンパイル用のコマンドを作成しましょう(compile)。
さらにフォーマット〜コンパイル〜プッシュを同時にやるコマンドも作ってしまいます（push）。
```diff json:package.json
{
  "scripts": {
    "lintfix": "prettier --write './src/**/*.{js,ts}' && eslint --fix './src/**/*.{js,ts}'",
+   "compile": "cp appsscript.json dist/appsscript.json && tsc",
+   "push": "yarn lintfix && yarn compile && clasp push -f"
  },
}
```

ここまでできたら実際にpushを実行してみて反映されているか確認してみましょう。
反映されていれば成功です。
```sh
yarn push # distの内容をGASサーバにプッシュ
clasp open # ブラウザでGASエディタが開くので、distの内容が反映されていることを確認
```

---

# APIのデプロイ
## API用のコードを作成
GASでAPIを作成する場合、利用できるHTTPメソッドはGETとPOSTのみです。
URLアクセスした時にGETの場合は`doGet`、POSTの場合は`doPost`関数が実行されるのでそれぞれ用意する必要があります。

なのでまずmain.tsに以下の内容を記述します。
```ts: main.ts
//eslint-disable-next-line @typescript-eslint/no-unused-vars
function doGet(e: Record<string, unknown>) {
    const result = executeDoGet(e)
    return converObjectToJsonString(result)
}

//eslint-disable-next-line @typescript-eslint/no-unused-vars
function doPost(e: Record<string, unknown>) {
    const result = executeDoPost(e)
    return converObjectToJsonString(result)
}

function executeDoGet(e: Record<string, unknown>) {
    console.log("start executeDoGet")
    return { status: 'ok', method: 'get' }
}

function executeDoPost(e: Record<string, unknown>) {
    console.log("start executeDoPost")
    return { status: 'ok', method: 'post' }
}

function converObjectToJsonString(result: Record<string, unknown>) {
    const payload = ContentService.createTextOutput(
        JSON.stringify(result)
    ).setMimeType(ContentService.MimeType.JSON)
    return payload
}
```
doGetは`{ status: 'ok', method: 'get' }`
doPostは`{ status: 'ok', method: 'post' }`
を結果として返す関数になっています。

GASでAPIを公開してjsonを返却する場合は、結果はオブジェクトのままでなく`converObjectToJsonString()`の処理を通す必要があります。

またローカルでESlintを利用していると`doGet`、`doPost`がどこからも参照されてないと怒られます。
これらは上述したようにここから処理が始まる関数で参照されないのは仕方がないので`//eslint-disable-next-line @typescript-eslint/no-unused-vars`のコメントで警告が出ないように防いでいます。


## ウェブアプリとしてデプロイ
GASのデプロイにはウェブアプリ、実行可能API、ライブラリなどいろいろな種類があります。
誰でもURLを叩けばJson結果を取得できるようにしたい場合はウェブアプリとしてデプロイする必要があります。
`appscript.json`にウェブアプリとしてデプロイする設定を追加します

```diff json:appscript.json
{
  "timeZone": "America/New_York",
  "dependencies": {
  },
  "exceptionLogging": "STACKDRIVER",
  "runtimeVersion": "V8",
+ "webapp": {
+  "access": "ANYONE_ANONYMOUS",
+  "executeAs": "USER_DEPLOYING"
+ }
}
```

この設定は、ブラウザ上でデプロイする場合の以下に相当します。
![](https://storage.googleapis.com/zenn-user-upload/hglnzqafszgnla0vudi3a3mw91h3)

この設定を追加後、以下のコマンドを打ちます
```sh
yarn push #appscriptの設定を反映
clasp deploy # デプロイ（公開）を実行
# 以下の結果が出たらOK
# Created version 1.
# - <デプロイID> @1.
```
これでデプロイが完了し処理が公開されました

`https://script.google.com/macros/s/<デプロイID>/exec`
にアクセスして`{"status":"ok","method":"get"}`の結果が返って来れば成功です

POSTメソッドの結果も確認したい場合はcurlを利用しましょう。
補足としてcurlでGASのAPIを叩く場合、GASのリダイレクト仕様のため以下のように叩く必要があります。
`-X POST`のオプションではうまく動かないので注意しましょう。
```sh
# doGet {"status":"ok","method":"get"} が返ってくる
curl -H "Content-Type: application/json" -L https://script.google.com/macros/s/<デプロイID>/exec

# doPost {"status":"ok","method":"post"}が返ってくる
curl -H "Content-Type: application/json" -L https://script.google.com/macros/s/<デプロイID>/exec -d {}
```

## デプロイ時のURL固定
単に`clasp deploy`を実行すると、デプロイIDとURLが毎回異なるものが生成されてしまいます。
これらを固定のIDにするには、オプションでデプロイIDを指定する必要があります。
`clasp deploy -i <デプロイID>`

毎回デプロイIDを指定するのは面倒なので、package.jsonにコンパイル〜ID指定デプロイまでやってくれるコマンドを作りましょう。
```diff json
"scripts": {
      "lint": "prettier './src/**/*.{js,ts}' && eslint './src/**/*.{js,ts}'",
      "lintfix": "prettier --write './src/**/*.{js,ts}' && eslint --fix './src/**/*.{js,ts}'",
      "push": "yarn lintfix && cp appsscript.json dist/appsscript.json && tsc && clasp push -f",
+     "deploy": "yarn push && clasp deploy -i <デプロイID>"
    },
```

## 検証環境・本番環境の作成
デプロイIDの異なる各デプロイは共存できます。
APIを修正する時に本番環境をいじるのは怖いので、検証と本番を用意しましょう。

まず先程作成したデプロイIDを検証環境デプロイIDとします。
もう一度`clasp deploy`をすれば別のデプロイIDが生成されるのでそれを本番環境用のデプロイIDとします。
そしてpackage.jsonに検証と本番用のデプロイコマンドを作りましょう。

```diff json
"scripts": {
      "lint": "prettier './src/**/*.{js,ts}' && eslint './src/**/*.{js,ts}'",
      "lintfix": "prettier --write './src/**/*.{js,ts}' && eslint --fix './src/**/*.{js,ts}'",
      "push": "yarn lintfix && cp appsscript.json dist/appsscript.json && tsc && clasp push -f",
-     "deploy": "yarn push && clasp deploy -i <デプロイID>"
+     "deploy-develop": "yarn push && clasp deploy -i <検証用のデプロイID> -d 'develop'",
+     "deploy-production": "yarn push && clasp deploy -i <本番用のデプロイID> -d 'production'"
},
```
これらもそれぞれcurlコマンドを叩いて応答が来ればOKです。


# `clasp run` コマンド利用のための設定
これまでの作業でコーディング〜デプロイ、動作確認までローカルでできるようになりました。
ですが現状では以下の問題があります。
- 動作確認をするのに毎回デプロイ（公開）が必要
- console.logのログがローカルから確認できない

これらはそれぞれ
- clasp run (デプロイ前のpushされているコードを実行)
- clasp logs (ログの出力)

コマンドが利用できれば解決しますが、そのためにはGCPの設定が必要です。

ややこしい作業が多くなるので、そこまで求めないという方は本章の作業はしなくても問題ありません。

## GCPプロジェクトの作成
最初に実行したclasp login で認証したアカウントでGCPプロジェクトを作成します
`https://console.cloud.google.com/`から
プロジェクトの作成 > 新しいプロジェクト を選択し
- プロジェクト名：任意
- 場所：任意

で新しいGCPプロジェクトを作成します
![](https://storage.googleapis.com/zenn-user-upload/17l4be50k870a6xyoqrd1l1sysdx)
![](https://storage.googleapis.com/zenn-user-upload/iwbdbhy8kjyb29875wn0d5rm2gmr)

## Oauthの同意設定
Oauthの同意設定が必要です。
GCPのダッシュボードに作成したGCPのプロジェクトIDが表示されているはずなのでそれをコピーし以下のリンクを開きます。
`https://console.developers.google.com/apis/credentials/consent?project=[PROJECT_ID]`

1. ラジオボタンで 外部を選択し 作成ボタンをクリック
2. アプリ情報の入力
   - アプリ名:任意
   - ユーザサポートメール:任意
   - メールアドレスを設デベロッパーの連絡先情報：任意
    を指定して次へ
3. スコープは指定なしで次へ
4. テストユーザーに最初に実行した`yarn run clasp login`で認証したアカウントのメールアドレスを追加して次へ
概要画面が表示されたらOauthの同意設定は完了です。

## claspにプロジェクトIDを設定
claspにプロジェクトIDを設定します
まず以下のコマンドを打ち.clasp.jsonにprojectIdを設定します
```sh
clasp setting projectId <作成したGCPのプロジェクトID>
```

次に`yarn run clasp open`でGASエディタを開き、設定ボタンからGCPプロジェクト番号（プロジェクトIDではないので注意）を設定します。
![](https://storage.googleapis.com/zenn-user-upload/shsd5gkmpoudu53itdo4xiid9eer)


## 認証情報を作成
`https://console.cloud.google.com/apis/credentials?project=[PROJECT_ID]`
から認証情報ファイルの作成します
1. 認証情報を作成> OauthクライアントID を選択
2. OAuth クライアント ID の作成
   - アプリケーションの種類：デスクトップアプリ
   - 名前：任意
3. ファイルをダウンロードし、creds.jsonという名前でプロジェクト直下に配置
   ![](https://storage.googleapis.com/zenn-user-upload/9qib0jncvsdxh3zghebfz7kad8jh)
4. `clasp login --creds creds.json`を実行するとブラウザで認証画面が開くので、認証 > 権限許可 を行う

## 実行可能APIとしてデプロイ
これでclasp run/clasp logsを使う環境が整いました。
しかしclasp runを実行するにはウェブアプリではなく実行可能APIとしてデプロイしておく必要があるのでその設定を入れます。
まずappscriot.jsonに実行可能APIとデプロイ設定をを追加します。
```diff json:appscriot.json
+  "executionApi": {
+    "access": "ANYONE"
+  }
```

そうしたらデプロイを実行します
```sh
yarn deploy-develop
```

これで`clasp run`,`clasp logs`以下を実行して結果が帰って来ればOKです。
```sh
clasp run executeDoGet
clasp run executeDoPost
clasp logs
```
`clasp run`では`converObjectToJsonString`の処理を通す必要がないので`executeDoGet`,`executeDoPost`を指定します

---

環境構築が終わったので、次にスプレッドシートの内容を返却するAPIを作成してみましょう。

# 執筆中...