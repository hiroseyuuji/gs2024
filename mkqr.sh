#!/bin/sh

paste -d, meibo.csv jumon.csv | while IFS=, read id kanji hiragana jumon
do
  qrencode -t png32 -o out/$id.png "$jumon"
done
