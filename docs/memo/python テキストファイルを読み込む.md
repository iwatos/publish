更新日: {{ git_revision_date }}

# python テキストファイルを読み込む
```python
## ファイル全体を一つの文字列として読み込む
def read_file_text(path: str):
    text: str = ""
    with open(input_file_path, 'r') as f:
        text = f.read() 
    return text 

## 一行ずつのリストとして読み込む
def read_file_text_as_lists(path: str):
    texts: list[str] = []
    with open(input_file_path, 'r') as f:
        texts = f.readlines() 
    return texts 

```

----
### Related Notes
- 

### References
- https://www.javadrive.jp/python/file/index2.html

### Tags
- 