#!/bin/bash

if [ $(pgrep video_edit.sh | wc -l) -gt 2 ];then
  echo "the cp_gopro2pi.sh script is still running"
  exit
fi

if [ "$(pgrep grive)" ];then
  echo "grive is already running"
  exit
fi
cd /googledrive/ && ./grive
