#! /bin/bash
# requirement:
#     ffmpeg
#     sox

for i in `ls *.mp4`; do
    f=$i
    filename=${f%.*}
    ffmpeg -i $i -an -qscale 0 denoise/$filename.an.mp4
    ffmpeg -i $i -vn denoise/$filename.wav
    sox denoise/$filename.wav denoise/$filename.denoise.wav noisered noise.prof 0.21
    ffmpeg -i denoise/$filename.denoise.wav -i denoise/$filename.an.mp4 $filename.clean.mp4
done