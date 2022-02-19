# python gitのコミット履歴をpythonで出力する
`poetry add GitPython` 

```python
import codecs
import os
import os.path
import re
from datetime import datetime

from git import Repo


def change_log(num, header=""):
    repo = Repo(f"{os.getcwd()}")
    msg = []
    for commit in repo.iter_commits("master", max_count=num):
        dt = datetime.fromtimestamp((commit.committed_date))
        buff = commit.message.split("\n")
        msg.append(f"{header} {dt.strftime('%Y-%m-%d %H:%M:%S')} {buff[0]}")
        if len(buff) > 2:
            ## 更新コメントがちゃんと書いてあったら詳細を書く
            msg += buff[2:]
        ## 更新ページ
        files = commit.stats.files.keys()
        for f in files:
            ext = os.path.splitext(f)[1]
            if ext == ".md":
                link = re.sub("^docs/", "", f.replace("\\", "/"))
                title = os.path.splitext(link)[0]
                if not title:
                    title = link
                msg.append(f"* [{title}]({link})")
        msg.append("")
    return "\n".join(msg)

```

---
## Related Notes
- 

## References
- https://fereria.github.io/reincarnation_tech/10_Programming/99_Documentation/04_mkdocs_updatelog/

## Tags
- `#python` 
- `#git`