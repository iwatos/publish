# nuxt NuxtBridge ページ遷移
```js
import { useRouter } from '@nuxt/bridge/dist/runtime'

const router = useRouter()

router.push("/")

router.push({
    path: mapPath,
    query: {
		hoge: "hoge",
    },
  })
```

---
### Related Notes
- 

### References
- 

### Tags
- `#nuxt`