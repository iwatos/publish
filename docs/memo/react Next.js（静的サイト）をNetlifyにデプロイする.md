# react Next.js（静的サイト）をNetlifyにデプロイする
## 前提
`$ npm create-next-app next-sample`
で生成されたNext.jsプロジェクトであること
SSRやSSGはよくわかってないです。

## 手順
1. package.jsonに以下を追記
	```json
	"scripts": {
	    "dev": "next dev",
	    "build": "next build",
	    "start": "next start",
	    "export": "next export" // ← ここを追記
	  },
	```
1. Netlifyでリポジトリ、ブランチを選択した後、**Basic build settings**で画像のように設定
![](https://storage.googleapis.com/zenn-user-upload/rjlczit75kuc1fqhijg54erqh79u)

1. **Deploy site**をクリックでデプロイ。　URLを確認してサイトが表示されればOK

---
## Related Notes
- 

## References
- 

## Tags
- `#notag`