#!/bin/bash

function genVideoList () {
    while read -r filename; do
    tmp0="${filename}"
    filetype="${tmp0:(-3)}"
    if [[ ${filetype} == "avi" ]]; then
      ffmpeg -i "${tmp0}" -c:v libx264 -profile high -level 4.1 -tune film -c:a libfdk_aac -b:a 192k -ar 48000 -map_metadata -1 -f mp4 "outdir/${tmp0:(-4)}.mp4"
    fi
    if [[ ${filetype} == "mkv" ]]; then
      ffmpeg -i "${tmp0}" -c:v libx264 -profile high -level 4.1 -tune film -c:a libfdk_aac -b:a 192k -ar 48000 -map_metadata -1 -f mp4 "outdir/${tmp0:(-4)}.mp4"
    fi
    if [[ ${filetype} == "mp4" ]]; then
      ffmpeg -i "${tmp0}" -c:v libx264 -profile high -level 4.1 -tune film -c:a libfdk_aac -b:a 192k -ar 48000 -map_metadata -1 -f mp4 "outdir/${tmp0:(-4)}.mp4"
    fi
    if [[ ${filetype} == "mpg" ]]; then
      ffmpeg -i "${tmp0}" -c:v libx264 -profile high -level 4.1 -tune film -c:a libfdk_aac -b:a 192k -ar 48000 -map_metadata -1 -f mp4 "outdir/${tmp0:(-4)}.mp4"
    fi
    if [[ ${filetype} == "vob" ]]; then
      ffmpeg -i "${tmp0}" -c:v libx264 -profile high -level 4.1 -tune film -c:a libfdk_aac -b:a 192k -ar 48000 -map_metadata -1 -f mp4 "outdir/${tmp0:(-4)}.mp4"
    fi
    if [[ ${filetype} == "wmv" ]]; then
      ffmpeg -i "${tmp0}" -c:v libx264 -profile high -level 4.1 -tune film -c:a libfdk_aac -b:a 192k -ar 48000 -map_metadata -1 -f mp4 "outdir/${tmp0:(-4)}.mp4"
    fi
  done < <(ls -1 | sort -u)
}

genVideoList
