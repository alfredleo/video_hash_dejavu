@ECHO OFF

FOR %%f IN (.\mp3\video\*.mp4) DO (
echo Converting: %%f
ffmpeg -y -ss 0 -t 150 -i "%%f" -ab 128k -map_metadata 0 ".\mp3\original\%%~nf.mp3"
)

FOR %%f IN (.\mp3\original\*.mp3) DO (
echo Converting: %%f
ffmpeg -y -ss 50 -t 60 -i "%%f" -ab 128k -map_metadata 0 ".\mp3\parts\%%~nf_1.mp3"
ffmpeg -y -ss 100 -t 120 -i "%%f" -ab 128k -map_metadata 0 ".\mp3\parts\%%~nf_2.mp3"
)

echo Finished

PAUSE