import os
import os.path
import re
import codecs
from datetime import datetime
from git import Repo

def define_env(env):
    def getTitle(md):
        if os.path.exists(md):
            with codecs.open(md, 'r', 'utf8') as f:
                for i in f.readlines():
                    if re.search("^title:", i):
                        return i.strip().split(":")[1]
        return None

    @env.macro
    def update_info(num, header="##"):

        repo = Repo(os.getcwd())
        msg = []
        for commit in repo.iter_commits('master', max_count=num):
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
                    title = getTitle(os.getcwd() + "/" + f)
                    if not title:
                        title = link
                    msg.append(f"* [{title}]({link})")
        return "\n".join(msg)
