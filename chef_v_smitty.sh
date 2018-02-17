#!/bin/bash

hash youtube-dl 2>/dev/null || { echo >&2 "Please install youtube-dl"; exit 1; }
hash ffmpeg 2>/dev/null || { echo >&2 "Please install ffmpeg"; exit 1; }
stitch_string=''
for i in `seq 2905 3000`;
do
	youtube-dl http://sprtbarstool.akamaized.net/hls/live/621176/rnr20216142820/exp=1518919110~acl=%2fhls%2flive%2f621176*~data=hdntl~hmac=6ab75f6ac1c056c6245e5e13d253e88c1da7da5e66155e1689507d3ee0b3c444/VIDEO_0_5564000/1518820189_set_1/OTT-barstool1_VIDEO_0_5564000_$i.ts
	stitch_string+='OTT-barstool1_VIDEO_0_5564000_'$i'-OTT-barstool1_VIDEO_0_5564000_'$i'.ts '
done

cat $stitch_string > ChefVSmitty.ts
ffmpeg -i ChefVSmitty.ts -acodec copy -vcodec copy ChefVSmitty.mp4
rm *.ts