import codecs
import os
import os.path
import re
from datetime import datetime
from turtle import up

from git import Repo


def change_log(num):
    msg = []

    repo = Repo(f"{os.getcwd()}")
    for commit in repo.iter_commits("master", max_count=num):
        updated_files = get_updated_files(commit.stats.files.keys())
        if not updated_files:
            continue

        commit_info = make_commit_info(commit)
        msg.append(commit_info)
        msg.append("\n".join(updated_files))
        msg.append("")
    return "\n".join(msg)


def get_updated_files(files):
    updated_files = []
    for f in files:
        ext = os.path.splitext(f)[1]
        if ext == ".md":
            link = re.sub("^docs/", "", f.replace("\\", "/"))
            title = os.path.splitext(link)[0]
            if not title:
                title = link
            updated_files.append(f"* [{title}]({link})")
    return updated_files


def make_commit_info(commit):
    updated_time = datetime.fromtimestamp((commit.committed_date))
    message = commit.message.replace("\n", " ")
    return f"### {updated_time.strftime('%Y-%m-%d %H:%M:%S')} {message}"


def replaceText(from_path, to_path, before, after):
    encoding = "utf-8"
    with open(from_path, encoding=encoding) as f:
        data_lines = f.read()

    data_lines = data_lines.replace(before, after)

    with open(to_path, mode="w", encoding=encoding) as f:
        f.write(data_lines)


replaceText(
    f"{os.getcwd()}/README.md",
    f"{os.getcwd()}/docs/index.md",
    "!change_log",
    change_log(10),
)
