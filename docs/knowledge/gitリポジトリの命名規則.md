# 結論
はじめに、**gitリポジトリに命名規則は存在しない**
だが、調べる限り **ケバブケース（小文字の英数字を利用、単語区切りは`-`を利用）** の命名が推奨される。
○:`sample-git-repository`

△:`sample_git_repository`
△:`SampleGitRepository`
△:`sampleGitRepository`
X:`samplegitrepository`

# 理由
- githubやBitBucketのURLでは小文字と大文字が区別されない、もしくは小文字に変換される可能性がある
- `_`より`-`のほうが入力が簡単

# 参考
https://qastack.jp/programming/11947587/is-there-a-naming-convention-for-git-repositories
https://teratail.com/questions/250459

---
# Related Notes
- 

# References
- 

# Tags
- #notag