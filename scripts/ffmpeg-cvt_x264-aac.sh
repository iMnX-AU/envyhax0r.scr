#!/bin/bash
mkdir -p "converted"
while read -r line; do
tmp0="${line}"
ffmpeg -i "${line}" -c:v libx264 -b:v 1000k -c:a aac -b:a 192k -ar 48000 -ac 2 -f mp4 "converted/${line::-4}.mp4"
done < <(ls -1)
