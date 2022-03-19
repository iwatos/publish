import glob
import os
import re
import shutil


def read_file_text(file_path: str):
    text: str = ""
    with open(file_path, "r") as f:
        text = f.read()
    return text


def write_text_file(path: str, text: str):
    dir_path = os.path.dirname(path)
    if not os.path.exists(dir_path):
        os.makedirs(dir_path)
    with open(path, "w") as f:
        f.write(text)


INPUT_DIRECTORY = "/Users/yt/Dropbox/obsidian/publish/"
OUTPUT_DIRECTORY = os.path.dirname(__file__) + "/../docs/"

shutil.rmtree(OUTPUT_DIRECTORY)
shutil.copytree(INPUT_DIRECTORY, OUTPUT_DIRECTORY)

path_list = glob.glob(f"{OUTPUT_DIRECTORY}**/*.md")
for path in path_list:
    file_name = os.path.basename(path)

    print(f"writing {file_name} ...")

    content = read_file_text(path)
    content = re.sub("# ", "## ", content)
    content = re.sub(r"(#{1}[^\t\n\r\f\v #]+)", r"`\1`", content)
    content = "\n".join(
        [
            "{{ git_revision_date }}",
            "",
            f"# {os.path.splitext(file_name)[0]}",
            "",
            content,
        ]
    )
    write_text_file(path, content)
