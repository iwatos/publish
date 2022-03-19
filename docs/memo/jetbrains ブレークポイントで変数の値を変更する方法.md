更新日: {{ git_revision_date }}

# jetbrains ブレークポイントで変数の値を変更する方法
## 環境
Intelij
Java(Java以外でもできるかもしれないけど未確認)

## 手順
下のようなコードを書くと、当然"Hello World"と表示されますが、
strに"ハローワールド！"という別の値をデバッグ中は入れたいとします。
<img width="709" alt="スクリーンショット 2019-10-28 22.51.25.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/378c10f1-398b-a7f6-287e-ef9ad54931e2.png">


そんなときはブレークポイントを設定
→右クリック
→More(command + shift + F8)
<img width="891" alt="スクリーンショット 2019-10-28 22.52.01.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/ba390ccc-5c54-286a-33c3-714721086a5a.png">

BreakPointsウィンドウが出るので
Evaluate and log にチェック
→strに値を代入
→（ブレークポイントで止めたくない場合）Suspendのチェックを外す
<img width="969" alt="スクリーンショット 2
019-10-28 22.52.47.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/57099699-bc5b-ce0f-d7b7-363487385cbe.png">

この状態でDebug実行すると
<img width="709" alt="スクリーンショット 2019-10-28 22.53.04.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/230281/ff698486-5002-7ebe-bfb7-5fa0505af320.png">

"ハローワールド！"と出ました。
二回出てるのはEvaluate and "log"によるログ出力のためです。

値の代入以外にも、メソッドの実行なども可能です。
特別な条件のときにしか実行されないコードのデバッグなどに使えると思います。
 

