# html table 行ごとに色を変える
```scss
table {
	tr {
		%%行ごとに色を変える%%
		&:nth-child(odd) { background: `#ffffff;}` %%奇数行%%
		&:nth-child(odd) { background: `#000000;}` %%偶数行%%
	}
	
	td {
		%%列ごとに色を変える%%
		&:nth-child(odd) { background: `#ffffff;}` %%奇数列%%
		&:nth-child(odd) { background: `#000000;}` %%偶数列%%
	}
}
```


---
## Related Notes
- 

## References
- https://gray-code.com/html_css/setting-background-color-for-each-table-line/

## Tags
- `#html` 