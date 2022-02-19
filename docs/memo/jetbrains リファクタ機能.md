# jetbrains リファクタ機能
## はじめに
InteliJをはじめとするJetBrains製IDE(AndroidStudio含む)では、右クリックのメニューから確認できるようにさまざまなコードリファクタ機能が存在します。それらの機能をご紹介します。
![](https://storage.googleapis.com/zenn-user-upload/ytimuy97qoq28tlas56zdh3r3coa)

なお画像のコードはPythonで書いてますが、IDE対応の言語でしたらいずれの機能も使えると思います。（全部確認したわけではないのであしからず）

## リファクタリング機能
### rename （名前の変更）
ショートカット：shift+F6
変数、クラス、ファイル名の定義を変更します。
他の参照箇所やimport文も変更してくれます。
![](https://storage.googleapis.com/zenn-user-upload/ep5mkhgtkobd0dwxlq711tyuhapr)

### Change Signature（引数の変更）
ショートカット：command+F6
関数の引数定義を変更します。引数の追加、削除のどちらも可能です。
![](https://storage.googleapis.com/zenn-user-upload/k5xx5k711e9sw365ycaiilryuecm)
![](https://storage.googleapis.com/zenn-user-upload/p3tyujdi6wnd37krw6b4jpgruexv)

### Move（定義箇所の移動）
ショートカット：F6
変数、クラスなどの定義箇所を別ファイルに移動します。
![](https://storage.googleapis.com/zenn-user-upload/v717ps5euorewb5lne244v6afsrn)

### Copy File（ファイルのコピー）
ショートカット：F5
ファイルを別ディレクトリにコピーします

### Introduce Variable(利用されている値を新しい変数として定義)
ショートカット：option+command+V
値を新しい変数に定義して置き換えます。
他で同じ値を使っている箇所も置き換えるか選択することができます。
![](https://storage.googleapis.com/zenn-user-upload/lt5g0348tmx4oxwdio501epbfvti)

### Introduce Parameter（利用されている値を関数の引数として定義）
ショートカット：option+command+P
利用している値が関数の引数となるように再定義します。
![](https://storage.googleapis.com/zenn-user-upload/df0qpr5tiv1uxjfh827itufdnh6o)

### ExtractSuperClass（スーパークラスの抽出）
スーパークラスを作成し、選択下クラスをサブクラスとして、
サブクラス内部の処理をスーパークラスに移動します
![](https://storage.googleapis.com/zenn-user-upload/qai5xkmah7ud6fiqworpfh0y4uvd)

### Inline（関数のインライン化）
ショートカット:option+command+N
関数を呼び出して実行する処理を、直接処理を記述するように書き換えます。
元の関数を残すか、消すか選択できます。
![](https://storage.googleapis.com/zenn-user-upload/dqvfncwh0kd1bnx47qvdejwa5jt8)

### Pull Members Up/Push Members Down（スーパークラス処理の抽出/移譲）
サブクラスの処理を一部スーパークラスに移動、
またはスーパークラスの処理をサブクラスに移動します。
![](https://storage.googleapis.com/zenn-user-upload/27dztwh97gs0qg39kfuauqdrkl1i)

## 最後に
Type Parameterだけよくわかりませんでした。
言語やIDEによっては他のメニューもでてくるかもしれませんが、とりあえずは
- rename
- ExtractMethod
- Inline
だけ覚えておくだけでも捗ります。

---
## Related Notes
- 

## References
- 

## Tags
- `#notag`