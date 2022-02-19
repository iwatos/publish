# gas TypeScriptでローカル開発環境を準備する
:::message
より詳しい環境構築方法や、デバッグの仕方なども書いているためよければこちらもご覧ください
https://zenn.dev/iwatos/books/752824c25d84fc4e1d2f
:::


## はじめに
今回の記事で作成した内容はこちらからクローンできます。
適宜設定変更して利用してください。
https://github.com/iwatos/gas-template

また、GASデプロイ/公開の詳しい内容は本記事では説明はしてません。

## GASプロジェクトの準備
プロジェクト用ディレクトリ名: `gas-project-directory`
プロジェクト名: `gas-project`
として説明を進めます。適宜自分のプロジェクトに合わせて変更してください。

まずGASプロジェクト用のディレクトリを作成します
```shell
mkdir gas-project-directory
cd gas-project-directory
```

以下のpackage.jsonをフォルダ直下に作成後、yarnかnpmでinstallを実行します
GASのローカル開発で用いる`clasp`のほか、`typescript` `eslint` `prettier`を導入してます。

```json:gas-project-directory/package.json
{
  "name": "<プロジェクト名>",
  "version": "1.0.0",
  "description": "Template of Google App Script ",
  "author": "<>",
  "license": "MIT",
  "scripts": {
    "lint": "prettier './src/**/*.{js,ts}' && eslint './src/**/*.{js,ts}'",
    "lintfix": "prettier --write './src/**/*.{js,ts}' && eslint --fix './src/**/*.{js,ts}'"
  },
  "dependencies": {
    "@google/clasp": "^2.3.0",
    "@types/google-apps-script": "^1.0.21"
  },
  "devDependencies": {
    "eslint": "^7.18.0",
    "prettier": "^2.2.1",
    "@typescript-eslint/eslint-plugin": "^4.14.0",
    "@typescript-eslint/parser": "^4.14.0",
    "eslint-config-prettier": "^7.2.0",
    "typescript": "^4.1.3"
  }
}
```
```sh
yarn install ## または `npm install`
```

GASをローカルで開発するためのツール`clasp`がインストールされます。
claspを利用してプロジェクトを新規作成します

まずは下記コマンドGoogleアカウント連携をおこないます。ブラウザ認証画面が表示されます。
```sh
clasp login 
```

次にプロジェクト作成をおこないます。
```sh
clasp create gas-project
## standalone, api, sheet, doc など初期設定を聞かれるので選ぶ
## どれを選んでも以降の作業に問題はないはず 
```
実行後にディレクトリ直下に　`.clasp.json` `appscript.json` が作成されます。

以降はTypeScriptの準備になります。
JSでも構わない方は、このまま下記のclaspコマンドを使用してローカルでGAS開発が行えます。

## clasp コマンド紹介
よく使うもの
- `clasp open` ブラウザでGASエディタを開く
- `clasp pull`クラウドで保存されている内容を取得する
- `clasp push` ローカルの内容をクラウドに反映させる
- `clasp deploy` GASを公開する
- `clasp login` Googleアカウントログイン
- `clasp logout` Googleアカウントログアウト

その他のコマンドが気になる方はこちらをご参照ください・
https://github.com/google/clasp/blob/a556599e78bdc3f168e3bb5cdc2ff0a55909f6f5/README.md

## TypeScript導入
まずソースコードはディレクトリ直下に`src`ディレクトリを作成してその配下に移動してください。
その後`.eslintrc.json` `.prettierrc.json` `tsconfig.json` をディレクトリ直下に作成します。

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

設定ファイルを作成し、以下コマンドが動作することを確認します。
```sh
yarn run prettier './src/**/*.{js,ts}'
yarn run eslint './src/**/*.{js,ts}'
```

以上でTS導入もこれで完了です。
`clasp　push`はクラウドへのプッシュと同時に TS ⇨ JS 変換も行いますので、TSコンパイルはローカルで行う必要はありません。