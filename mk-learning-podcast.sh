#!/bin/bash
# リストに書かれたファイルを順番にコピーする

# パスとか
f="../../Music/files/"
t="../../Music/learning/"
l="list.txt"

# 1行目のファイルをコピーする
h=`head -n 1 $l`
cp $f$h $t

# 1行目を最下行へ移動
echo $h >> $l
tail -n +2 $l > p
mv p $l
