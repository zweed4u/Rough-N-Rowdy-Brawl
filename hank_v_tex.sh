#!/bin/bash

stitch_string=''
for i in `seq 1650 1720`;
do
	youtube-dl https://bcsecurelivehls-i.akamaihd.net/hls/live/567277/4289043293001/account=4289043293001/fd9b6917a8364cc2979d96d5b9b70228/4289043293001_8888_6b0_2500-0$i.ts
	stitch_string+='4289043293001_8888_6b0_2500-0'$i'-4289043293001_8888_6b0_2500-0'$i'.ts '
done

cat $stitch_string > HankVTex.ts
ffmpeg -i HankVTex.ts -acodec copy -vcodec copy HankVTex.mp4
