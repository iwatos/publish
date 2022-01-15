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
        msg.append("")
        if len(buff) > 2:
            # 更新コメントがちゃんと書いてあったら詳細を書く
            msg += buff[2:]
        # 更新ページ
        files = commit.stats.files.keys()
        for f in files:
            ext = os.path.splitext(f)[1]
            if ext == ".md":
                link = re.sub("^docs/", "", f.replace("\\", "/"))
                title = os.path.splitext(link)[0]
                if not title:
                    title = link
                msg.append(f"* [{title}]({link})")
    return "\n".join(msg)


def replaceText(from_path, to_path, before, after):
    encoding = "utf-8"
    with open(from_path, encoding=encoding) as f:
        data_lines = f.read()

    data_lines = data_lines.replace(before, after)

    with open(to_path, mode="w", encoding=encoding) as f:
        f.write(data_lines)

replaceText(f"{os.getcwd()}/README.md",f"{os.getcwd()}/docs/index.md", "!change_log", change_log(10))
