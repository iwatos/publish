# python datetime（+pendulum）の扱いまとめ
## datetime
[フォーマッタ書式コード](https://docs.python.org/ja/3/library/datetime.html`#strftime-and-strptime-format-codes)`
### import+TimeZone
```py
from datetime import datetime, timezone
TIME_ZONE: str = timezone(timedelta(hours=+9), 'Asia/Tokyo')
```
### 現在時刻でdatetime生成
```py
datetime.now(TIME_ZONE)
```
### 指定時刻でdatetime生成
```py
datetime(year=2020, month=1, day=30, hour=12, minute=00, second=00, tzinfo=TIME_ZONE) 
```
### datetime → str(ISO形式)
```py
datetime.now().isoformat('seconds')
```
### datetime → str(指定形式)
```py
datetime.now().strftime('%Y-%m-%d %H:%M:%S') 
```
### str → datetime (ISO形式)
```py
datetime.fromisoformat("1975-05-21T22:00:00+09:00")
```
### str → datetime (指定形式)
```py
datetime.strptime("1975/05/21 22:10:30", "%Y/%m/%d %H:%M:%S")　
```
### date,timeからのdatetime生成
```py
now = datetime.now()
new_datetime = datetime.combine(now.date(), now.time(), tzinfo=TIME_ZONE)
```

## pendulum
[フォーマッタ書式コード](https://pendulum.eustace.io/docs/`#tokens)`
### import+TimeZone
```py
import pendulum
TIME_ZONE: str = "Asia/Tokyo"
```
### 現在時刻でdatetime生成
```py
pendulum.now(TIME_ZONE) 
```
### 指定時刻でdatetime生成
```py
pendulum.datetime(year=2020, month=1, day=30, hour=12, minute=00, second=00, tz=TIME_ZONE)
```
### datetime → str(ISO形式)
```py
pendulum.now(TIME_ZONE).isoformat('seconds')
```
### datetime → str(指定形式)
```py
pendulum.now(TIME_ZONE).format("YYYYMMDDHHmmSS")
```
### str → datetime(ISO形式)
```py
pendulum.parse("1975-05-21T22:00:00+09:00")  
```
### str → datetime(指定形式)
```py
pendulum.from_format("1975/05/21 22:10:30", "YYYY/MM/DD HH:mm:SS", tz=TIME_ZONE)　
```