更新日: {{ git_revision_date }}

# node "Update this package.json to use a subpath pattern like ..." エラー
node16系でPostCSSに依存したライブラリを利用すると以下のエラーが出る。
Nodeを14系に落とせば出て来なくなる
```
(node:61452) [DEP0148] DeprecationWarning: Use of deprecated folder mapping "./" in the "exports" field module resolution of the package at /Users/ytk
g/Workspace/react-typescript-tailwind-boilerplate/node_modules/postcss-safe-parser/node_modules/postcss/package.json.
Update this package.json to use a subpath pattern like "./*".
(Use `node --trace-deprecation ...` to show where the warning was created)
```

----
### Related Notes
- 

### References
- [【Create React App】yarn buildした時に出た警告の対応 | 高木のブログ](https://takagi.blog/create-react-app-yarn-build-warning/)

### Tags
- 