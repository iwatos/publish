Kindle For PCを立ち上げ、最新の状態に更新する

kindle for PCのキャッシュファイルから一覧情報を取得する

```py
from xml.etree import ElementTree

# MacOSの場合
xml_path = "$HOME/Library/Containers/com.amazon.Kindle/Data/Library/Application Support/Kindle/Cache/KindleSyncMetadataCache.xml"
root = ElementTree.parse(xml_path)
titles = [title.text for title in root.iter("title")]
for title in sorted(titles):
    print(title)
```


---
# Related Notes
- 

# References
- https://qiita.com/taka_hira/items/8a9181c0733de2c9f8ee

# Tags
- #tool
- #python 