# todoist タスク一覧取得
https://developer.todoist.com/rest/v1/`#overview`

```sh
## project一覧
curl -X GET "https://api.todoist.com/rest/v1/projects" -H "Authorization: Bearer <api_key>" | jq

## section一覧
curl -X GET "https://api.todoist.com/rest/v1/sections" -H "Authorization: Bearer <api_key>" | jq

## task一覧
curl -X GET "https://api.todoist.com/rest/v1/tasks" -H "Authorization: Bearer <api_key>" | jq
```

## fish alias
```sh
function today-task
  curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=<section_id>" -H "Authorization: Bearer <api_key>" | 
  jq -r '.[] | if .priority == 4 then "- A:" + .content elif .priority == 3 then "- B:" + .content elif .priority == 2 then "- C:" + .content else "- " + .content end' |
  pbcopy
end
```

---
### Related Notes
- 

### References
- 

### Tags
- `#tool` 