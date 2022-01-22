```sh
find <directory_path> -name <file_name_regex> | while read file
do
	command <option>
done

# 例
# find ./docs/publish -name '*.md' | while read file
# do
# 	sed -ie "s|# |## |g" "${file}"
# done
```

---
## Related Notes
- 

## References
- https://www.webdevqa.jp.net/ja/linux/%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E5%86%85%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AB%E5%AF%BE%E3%81%97%E3%81%A6%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AEbash%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88/1067276055/

## Tags
- #cli 