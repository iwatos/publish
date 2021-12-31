# proxy設定
https://one-sthead.hatenablog.com/entry/2019/07/02/122304

yarn config list で設定確認

```sh
// ID & Passなし
yarn config set proxy http://example.com:port -g

// ID & Passあり
yarn config set proxy http://username:password@host:port -g

// ID & Passなし
yarn config set https-proxy http://example.com:port -g

// ID & Passあり
yarn config set https-proxy http://username:password@host:port -g
```



---
# Related Notes
- 

# References
- 

# Tags
- #js 