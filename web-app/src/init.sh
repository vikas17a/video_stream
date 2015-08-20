#!/bin/bash

#Script contains initial check for the web application
LOGFILE="../stream.log"
LINUX=$(awk '/^LINUX/{print $3}' ../.config/vlc.conf)
CODEC=$2
INPUTSTREAM=$1
PORT=$3
case $LINUX in
  "centos") vlc=$(rpm -qa 'vlc')
            if [ -z $vlc ]; then
              echo "[Package]: vlc missing. Please install vlc"
              exit 1
            fi
            ;;
  *)        echo "Linux not supported for this application"
            exit 1
            ;;  
esac

case $CODEC in
  "default" ) sout="#transcode{vcodec=h264,vb=800,width=640,height=480,acodec=mp3,ab=128,channels=2,samplerate=44100}:http{mux=ffmpeg{mux=flv},dst=:$PORT/}"
              ;;
  *)          echo "Codec is not supported for now try default codec"
              exit 1
              ;;
esac

#Starting vlc stream
vlc -vvv $INPUTSTREAM --sout \'$sout\' &>> $LOGFILE &