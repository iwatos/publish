```sh
curl -H "Origin: #{アクセス元のドメイン}" \
     -H "Access-Control-Request-Method: #{メソッド}" \
     -X OPTIONS --verbose \
        #{アクセス先のURL}
```
CORSで許可されている場合、Access-Control-Allow-OriginやAccess-Control-Allow-Methodsが返ってくる

---
# Related Notes
- 

# References
- https://qiita.com/hideukin/items/4c149be72c41c795cdf5
- https://omohikane.com/test_cors_with_curl/


# Tags
- #cli 