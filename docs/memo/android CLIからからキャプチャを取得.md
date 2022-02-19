# android CLIからからキャプチャを取得
## スクリーンショット

```sh
`#!/bin/sh`

DATE=`date '+%Y%m%d%H%M%S'`
FILE_NAME=record-${DATE}
YOUR_PATH=~/Downloads

adb shell screencap -p /sdcard/${FILE_NAME}.png
adb pull /sdcard/${FILE_NAME}.png $YOUR_PATH
adb shell rm /sdcard/${FILE_NAME}.png
```

## 動画
```sh
`#!/bin/sh`

DATE=`date '+%Y%m%d%H%M%S'`
FILE_NAME=record-${DATE}
YOUR_PATH=~/Downloads

adb shell screenrecord /sdcard/${FILE_NAME}.mp4 &
pid=`ps x | grep -v grep | grep "adb shell screenrecord" | awk '{ print $1 }'`

if [ -z "$pid" ]; then
  printf "Not running a screenrecord."
  exit 1
fi

read -p "Recording, Hit any key when it's finished"

kill -9 $pid ## Finished the process of adb screenrecord
while :
do
  alive=`adb shell ps | grep screenrecord | grep -v grep | awk '{ print $9 }'`
  if [ -z "$alive" ]; then
      break
  fi
done

printf "Finished the recording process : $pid\nSending to $YOUR_PATH...\n"
adb pull /sdcard/${FILE_NAME}.mp4 $YOUR_PATH
adb shell rm /sdcard/${FILE_NAME}.mp4

printf "Converts to GIF"
ffmpeg -i ${YOUR_PATH}/${FILE_NAME}.mp4 -vf scale=240:-1 -an -r 15 -pix_fmt rgb24 -f gif ${YOUR_PATH}/${FILE_NAME}.gif
```



---
## References
- 

## Tags
- `#android` 