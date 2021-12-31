
```sh
jq -s -R 'split("\n")|map(split(","))|map({
				   "id": .[1],
				   "name": .[2]
               })' file.csv > file.json
```

---
# Related Notes
- 

# References
- 

# Tags
- #cli 