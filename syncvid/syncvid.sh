#!/bin/bash

if [ "$(pgrep grive)" ];then
  echo "it is already running"
  exit
fi

if [ ! -f /cam/grive.txt ]; then
  echo "file does NOT exist"
  exit
fi

cd /googledrive/ && ./grive
rm -f /cam/grive.txt
