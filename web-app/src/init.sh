#!/bin/bash

LOGFILE="../stream.log"
LINUX=$(awk '/^LINUX/{print $3}' ./.config/vlc.conf)
CODEC=$(awk '/^CODEC/{print $3}' ./.config/vlc.conf)
PORT=$(awk '/^PORT/{print $3}' ./.config/vlc.conf)
INPUTSTREAM=$1
IP=$2

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
  "default" ) sout=":sout=#transcode{vcodec=VP80,vb=2000,acodec=vorb,ab=128,channels=2,samplerate=44100}:udp{dst=$IP:$PORT} :sout-keep"
              ;;
  *)          echo "Codec is not supported for now try default codec"
              exit 1
              ;;
esac

#Starting vlc stream
vlc $INPUTSTREAM --sout $sout &> $LOGFILE &

# USING UDP FOR VIDEO STREAMING #
