Tomcat起動時に`Port already in use: [ポート番号]`というエラーが出たときはTomcatが正常に終了していないので、プロセスを削除する

# Mac
```sh
	netstat -anv | grep <ポート番号>
# 以下のような結果が出るはず tcp46の部分
# tcp46 0 0 *.1099 *.* LISTEN 131072 131072 <PID> 0 0x0100 0x00000006
kill <PID>
```

---
## Related Notes
- 

## References
- 

## Tags
- #tomcat 