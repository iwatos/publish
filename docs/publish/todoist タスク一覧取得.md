#tool 
https://developer.todoist.com/rest/v1/#overview

```sh
# project一覧
curl -X GET "https://api.todoist.com/rest/v1/projects" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | jq

# section一覧
curl -X GET "https://api.todoist.com/rest/v1/sections" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | jq

# task一覧
curl -X GET "https://api.todoist.com/rest/v1/tasks" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | jq
```

# 仕事用
```sh
# work/today
curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=55767467" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | jq
# work/done
 curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=56532792" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | jq


# work/today（優先度,箇条書き付き）
 curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=55767467" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | \
 	jq -r '.[] | 
	if .priority == 4 then "- A:" + .content
	elif .priority == 3 then "- B:" + .content
	elif .priority == 2 then "- C:" + .content
	else "- " + .content
	end'
	
# work/done（優先度,箇条書き付き）	
 curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=56532792" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | \
 	jq -r '.[] | 
	if .priority == 4 then "- A:" + .content
	elif .priority == 3 then "- B:" + .content
	elif .priority == 2 then "- C:" + .content
	else "- " + .content
	end'
```

# fish alias
```sh
function today-task
  curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=55767467" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | 
  jq -r '.[] | if .priority == 4 then "- A:" + .content elif .priority == 3 then "- B:" + .content elif .priority == 2 then "- C:" + .content else "- " + .content end' |
  pbcopy
end

function done-task
  curl -X GET "https://api.todoist.com/rest/v1/tasks?section_id=56532792" -H "Authorization: Bearer 8d68be4e5b41ea362bcdf08f34511be00439d3ac" | 
  jq -r '.[] | if .priority == 4 then "- A:" + .content elif .priority == 3 then "- B:" + .content elif .priority == 2 then "- C:" + .content else "- " + .content end' |
  pbcopy
end
```