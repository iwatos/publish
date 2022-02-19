# css 長形（横に伸縮する）フォントの表示
長形フォントの描画に苦労したのでメモ

```html
    <div class="longtype-container">
        <p class="longtype-content">長形フォント</p>
    </div>
```

```scss
$scale: 0.5; //倍率
$font-size: 50px;

.longtype-container {
    width: 100px;
    margin: 0;
    background: grey;

    .longtype-content {
        font-family: "メイリオ"; //計算の簡単のため等倍フォント
        font-size: $font-size;
        line-height: $font-size; //font-sizeと同じ値を設定しない場合上下の位置がずれる
        text-align: left; //左寄せ
        transform: scaleX($scale);
        transform-origin: left; //拡大の起点を左端に
        width: 100% / ($scale); //行折り返し点の調整
    }
}
```

$scaleの値を変更すれば伸縮率を変更できる。
