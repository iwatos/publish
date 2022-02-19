# trello APIでタスク一覧を取得
`#tool`
```sh
curl "https://trello.com/1/lists/<list_id>/cards?key=<key>&token=<token>" | \
  jq '.[] | {"name": .name, "labels": [.labels[].name] }' | \
  jq -r 'if any(.labels[]; contains("done")) then "- [x] " + .name else "- [ ] " + .name end' | \
  sed -e 's/- \\[ \\] `#/``#/g'` | pbcopy
```