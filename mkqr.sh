#!/bin/sh

paste -d, meibo.csv jumon.csv | while IFS=, read id kanji hiragana jumon; do
  qrencode -o out/$id.png "$jumon"
done
