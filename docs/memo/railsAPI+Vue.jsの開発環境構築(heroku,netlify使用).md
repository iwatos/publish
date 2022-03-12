# railsAPI+Vue.jsの開発環境構築(heroku,netlify使用)
## 概要
バックエンドでrails、フロントではVueを使いたい。
連携させるにはrailsでAPIサーバを作成してVueで呼ぶのがいいかと考えました。
しかしまとまったやり方が調べても出てこなかったので自分なりのやり方をまとめました。
rails,vue-cliでプロジェクト作成可能な状態であり
heroku,netlifyのアカウントは登録済みとします。

3/27 端末への環境変数設定を修正しました。
4/20 netlifyで動作する際の環境変数設定について修正しました。

## 環境
Rails: 5.1.6.2
vue-cli: 3.3.0
heroku: 7.22.7 darwin-x64 node-v11.10.1

## 手順
### railsプロジェクトの準備
railsアプリを作成する
まずはAPI用のrailsプロジェクトを作成

```terminal
$ rails new ***-api --api
$ cd ***-api
```
gemファイルの以下を変更し bundle install します。
生成時からの修正点は以下

* コメントアウト部分を削除
* gemファイルの本番環境にpostgreを追加
* sqliteを開発環境に限定
    * herokuはsqliteでなくpostgreを使用するため
* rack-corsを追加
    * クロスドメイン対策（後述）で使用

```ruby:Gemfile
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "`#{repo_name}/``#{repo_name}"` unless repo_name.include?("/")
  "https://github.com/`#{repo_name}.git"`
end

gem 'rails', '~> 5.1.6', '>= 5.1.6.2'
gem 'puma', '~> 3.7'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'sqlite3'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

## Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

```

config/initializers/cors.rbのコメントアウトを解除し
originsを'*'に修正します。
先ほどのrack-corsの追加と本設定をしないとvueからAPIを呼び出した際にエラーが発生します。
[(参考)【Ruby on Rails】「No 'Access-Control-Allow-Origin' header is present on the requested resource」を回避する.](https://qiita.com/residenti/items/3a03e5e0268b354284b7)

```ruby:config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' `#コメントアウトを解除し、ここを'*'に修正`
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

jsonで渡す用のデータを作成　今回はサンプルとしてUserテーブルを作ります

```terminal
$ rails generate scaffold user name:string email:string password_digest:string
$ rails db:migrate
```
適当なデータを入れておきましょう

```terminal
$ rails console
>user1 = User.new(name:"hoge_name",email:"hoge_email",password_digest:"hoge_pass")
>user1.save
>user2 = User.new(name:"fuga_name",email:"fuga_email",password_digest:"fuga_pass")
>user2.save
>User.all
>exit
```

取得できるか確認します。

```terminal
$ curl -X GET  -H 'Content-Type:application/json' http://0.0.0.0:3000/users
`#結果表示`
```
以上ができたらherokuにアップロードしておきましょう。

```terminal
`#commit,herokuログイン後`
$ git push heroku master
$ heroku run rake db:migrate `#herokuのdb準備`
```

herokuにアップロードされたアドレス　https://＊＊＊.herokuapp.com/users
にアクセスしjsonデータが表示されればOKです。


## Vueプロジェクトの準備. 
Vueプロジェクトを作成します。作成後はとりあえず動くか確認しましょう。
プリセット設定はなんでも大丈夫だと思います。

```terminal
$ vue create *** 
~~プリセット設定~~
$ cd ***
$ yarn serve　`#動作確認`
```

今回はサンプルとして初期表示ページでAPIからjsonを取得して表示したいと思います。
json取得のためaxiosをインストールします

```terminal
$ npm install axios --save
```
次にsrc/components/HelloWorld.vueを以下のように編集します。

```vue:src/components/HelloWorld.vue
<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h1>{{ info }}</h1>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'HelloWorld',
  props: {
    msg: String,
  },
  data() {
    return {
      info: ""
    }
  },
  mounted () {
    axios.get("http://localhost:8080/users").then(response => (this.info = response))
  }
}
</script>
```
上記を保存し yarn serve すると、ページ上にuserのデータが表示されます。
ここまでできたらvueプロジェクトもgithub等にpushしnetlifyで公開してしまいましょう。
[(参考)vue-cliでwebアプリケーションを作って、Netlifyを使って無料で爆速でリリースした話](https://qiita.com/tiwu_official/items/5d1e883b3190cd8de56f)（リリースまででOK）

### 本番環境の連携
さて、ここまででローカルでの連携は終わりました。
しかしnetlifyで公開したページを見るとjsonデータは表示されずエラーを吐いています。
axios.getでlocalhostを参照しているので当然ですね。
ここからは本番環境（heroku-netlify間）でも連携するように修正していきます。

まずは開発環境の環境変数を設定します
vueプロジェクトのフォルダに環境変数を設定するフォルダを作成します。

```terminal:
$ touch .env.development
```
内容に以下を追記します。

```:.env.development
VUE_APP_BASE_API=http://localhost:3000/
```

HelloWorld.vueのaxios.getについて、参照先を環境変数から取得するよう修正します

```js:src/components/HelloWorld.vue
  mounted () {
    axios.get(process.env.VUE_APP_BASE_API + "users").then(response => (this.info = response))
  }
```
process.env.VUE_APP_*** は先ほど作成したenvファイルから値を取得します
yarn serveで起動した時は.env.developmentから値を取得します。
これによりローカルではlocalhostを参照するようになります。
[(参考)vue-cli 3.0 で作成したプロジェクトの環境変数(.env)の設定](https://qiita.com/h-reader/items/9e2f8dbc3b9eaec4f5ee)

後述しますが、環境変数には他の人に見られたくないものを書いたりするので
gitignoeに忘れずに登録しておきましょう。

```:gitignore
.env.*
```

次に本番環境(netlify)での環境変数を設定します。

netlify→プロジェクト選択→Settings→Build&Deploy→Environment
でnetlfy上の環境変数が設定できます。
「Edit variables」ボタンを押し、
VUE_APP_BASE_API に https://(herokuで設定したアドレス).herokuapp.com/　を設定します。
![スクリーンショット 2019-04-20 13.19.47.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/fd12140c-f942-d12c-978a-5fa0b3de0d82.png)
（画像のVUE_APP_***_TOKENについては後述）

### API認証の設定
現在の状況ではURLを知っていれば誰でもuserの中身がわかってしまいます。
なので認証をつけてVueのプロジェクトからしか見られないようにします。

application_controllers.rbに認証機能を追記します。
これによりいずれのアクションが起動する際も認証が必要となります。

```ruby:app/controllers/application_controllers.rb
class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate
    def authenticate `#環境変数API_TOKENがrailsとvueで一致しないと認証されない`
        authenticate_or_request_with_http_token do |token,options|
            token == ENV.fetch('API_TOKEN')
        end
    end
end

```

API_TOKENは環境変数で設定します。
今回は先ほどと違い、自身の端末に設定します。

```terminal
`#.bash_profileを編集`
$ emacs ~/.bash_profile
```
```:~/.bash_profile
`#以下を追記`
export　API_TOKEN=(任意の予測不可能な文字列)
```
```terminal
`#変更を反映`
$ source ~/.bash_profile
```

本番環境(heroku)でも同様の文字列を環境変数に設定します。

```terminal
$ heroku config:set API_TOKEN=xxxxx
```

次にvueプロジェクトで同様のトークンキーを設定します。

```:.env.development
VUE_APP_BASE_API=http://localhost:3000/
VUE_APP_API_TOKEN=xxxxx
```
netlifyでも同様のトークンキーを設定します。
下記画像ではVUE_APP_FREAD_TOKENとなっていますがVUE_APP_API_TOKEN（env.developmentと同じ変数名）にトークンキーを設定してください。
![スクリーンショット 2019-04-20 13.19.47.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/fd12140c-f942-d12c-978a-5fa0b3de0d82.png)

最後にHelloWorld.vueのmountedを編集します
headersにトークンを追加します。

```js:src/components/HelloWorld.vue
  mounted () {
    axios
      .get(process.env.VUE_APP_BASE_API + "users",{
        headers : { "Authorization": "Token " + process.env.VUE_APP_API_TOKEN }
        }).then(response => (this.info = response))
  }
```

上記で本番環境でもAPI連携が可能になりました。
heroku,netlifyにあげて確認しましょう

## おわりに
APIサーバ作るのも初めてだったのでなにか不備があればご指摘お願いします。
テスト環境とかも作らなければ…

## そのたお世話になった記事
[Rails5 APIで認証付きのWebAPIを作ってみる](https://qiita.com/ochiochi/items/966b884eb17045dfb929)
