# python 画像認識
tesseractのインストール
```
brew install tesseract
```
/usr/local/share/tessdata  に日本語学習データを配置
fast版は早くて精度もいいのでおすすめ
横書き: https://github.com/tesseract-ocr/tessdata_fast/blob/main/jpn.traineddata
縦書き: https://github.com/tesseract-ocr/tessdata_fast/blob/main/jpn_vert.traineddata


`poetry add pyocr`を実行した後
```python
import glob
import os
import pathlib

import pyocr
import pyocr.builders
from PIL import Image

tools = pyocr.get_available_tools()
tool = tools[0]

images_dir = "./images"
file_list = sorted(pathlib.Path(images_dir).glob("*.*"))

for file in file_list:
    print(file.name)
    input_img = Image.open(file)
    
	jpn_text = tool.image_to_string(
        input_img, lang="jpn", builder=pyocr.builders.TextBuildoer(tesseract_layout=6)
    )
	print(jpn_text)
    
	jpn_vert_text = tool.image_to_string(
        input_img,
        lang="jpn_vert",
        builder=pyocr.builders.TextBuilder(tesseract_layout=5),
    )
	print(jpn_vert_text)

```

## tesseract_layoutについて
0	文字角度の識別と書字系のみの認識(OSD)のみ実施（outputbase.osdが出力され、OCRは行われない）
1	OSDと自動ページセグメンテーション
2	OSDなしの自動セグメンテーション（OCRは行われない）
3	OSDなしの完全自動セグメンテーション（デフォルト）
4	可変サイズの1列テキストを想定する
5	縦書きの単一のテキストブロックとみなす
6	単一のテキストブロックとみなす（5と異なる点は横書きのみ）
7	画像を1行のテキストとみなす
8	画像を単語とみなす
9	円の中に記載された1単語とみなす（例：①、⑥など）
10	画像を1文字とみなす
11	まだらなテキスト。特定の順序でなるべく多くの単語を検出する（角度無し）
12	文字角度検出を実施(OSD)しかつ、まだらなテキストとしてなるべく多くの単語を検出する
13	Tesseract固有の処理を回避して1行のテキストとみなす
https://qiita.com/henjiganai/items/7a5e871f652b32b41a18`#3-%E3%83%9A%E3%83%BC%E3%82%B8%E3%82%BB%E3%82%B0%E3%83%A1%E3%83%B3%E3%83%86%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%83%A2%E3%83%BC%E3%83%89psm%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6`

---
## Related Notes
- 

## References
- 

## Tags
- `#python` 