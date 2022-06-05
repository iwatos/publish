更新日: {{ git_revision_date }}

# obsidianの記事をzenn用に変換する
```python
import re
import shutil

input_file_path = "/Users/yt/Dropbox/obsidian/publish/memo/ios AppStore用証明書の作成.md"
input_images_directory = "/Users/yt/Dropbox/obsidian/attachments/"
output_file_path = "./result/result.md"
output_images_directory = "./result/"

input_file_text = ""
with open(input_file_path) as f:
    input_file_text = f.read() 

pattern = r"!\[\[(.*\.(png|jpg|jpeg|gif))\]\]"
rpattern = re.compile(pattern)
result = rpattern.sub(r"![](/images/\1)", input_file_text)

with open(output_file_path,"w") as f:
    f.write(result)


lists = re.findall(r"!\[\[(.*\.(png|jpg|jpeg|gif))\]\]", input_file_text)
for l in lists:
    shutil.copy(input_images_directory + l[0], output_images_directory)
```

----
### Related Notes
- 

### References
- 

### Tags
- 