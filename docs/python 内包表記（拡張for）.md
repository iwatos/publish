# python 内包表記（拡張for）

```py
sample_list = [1,1,2,2,3,3]

my_list = [i * 2 for i in sample_list if i % 2 != 0] ## [2,2,6,6]
my_set = { i * 2 for i in sample_li ist if i % 2 != 0} ## {2,6}
my_dict = {val:index for val, index in enumerate(["foo", "bar", "baz"])} ## {'foo': 0, 'bar': 1, 'baz': 2} 
my_generator = (i for i in range(10))
```

## References
https://zenn.dev/ryo_kawamata/articles/intoroduce-list-compression

---
## Related Notes
- 

## References
- 

## Tags
- `#python` 