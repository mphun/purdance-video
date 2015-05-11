#!/bin/bash

if [ $(pgrep video_edit.sh | wc -l) -gt 2 ];then
  echo "it is already running"
  exit
fi

cd / && wget --no-clobber -r -l 4 -A.MP4 http://10.5.5.9:8080/videos/DCIM/100GOPRO/
rm -f /cam/tmp/*
gopro=$(ls /cam/gopro/)
cloud=$(ls /cam/purcam/)
missing_vids=$(grep -v -f <(printf "%s\n" "${cloud[@]}") <(printf "%s\n" "${gopro[@]}"))

for i in $missing_vids; do
  echo $i
  #ffmpeg -i /cam/gopro/$i.MP4 -sameq /cam/tmp/$i.mpg
  #avconv -i "concat:/cam/intro.mpg|/cam/tmp/$i.mpg" -c copy /cam/purcam/$i.mpg
#  MP4Box -cat /cam/intro.MP4 -cat /cam/gopro/$i -new /cam/purcam/$i 

   cp /cam/gopro/$i /cam/purcam/$i #temp for now until we fix intro


  rm -f /cam/tmp/$i.mpg
done

if [ "$(pgrep grive)" ];then
  echo "grive is already running"
  exit
fi
cd /googledrive/ && ./grive
