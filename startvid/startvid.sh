#!/bin/bash

if [ "$(pgrep streamer)" ];then
  echo "it is already running"
  exit
fi

if [ ! -f /cam/start.txt ]; then
  echo "file does NOT exist"
  exit
fi

if [ ! `cat /cam/start.txt | grep :` ]; then
  echo "missing time argument"
  exit
fi

time=`cat /cam/start.txt | grep :`
filename="/cam/purcam/$(date +%s).avi"
streamer -q -c /dev/video0 -f rgb24 -r 20 -t $time -o $filename
rm -f /cam/start.txt
