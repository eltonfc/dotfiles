#!/bin/bash

[ -z "$1" ] && exit 1
[ -f "$1" ] && exit 2

ffmpeg  -framerate 1 -f x11grab -s 1600,900 -i :0.0+0,0 \
	-vf settb=\(1/30\),setpts=N/TB/30 -r 30 -y \
	-vcodec libx264 -crf 23 -preset ultrafast -threads 0 \
	$1
