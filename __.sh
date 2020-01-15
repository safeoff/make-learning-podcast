#!/bin/bash
# リストに書かれたファイルを順番にコピーする

# パスとか
f="../../Music/system/"
t="../../Music/learning/"
l="list.txt"

# 下から2行め（2つ前）のファイルをコピーする
h=`tail -n 2 $l | head -n 1`
cp $f$h ${t}p2_$h
# 下から7行め（7つ前）のファイルをコピーする
h=`tail -n 7 $l | head -n 1`
cp $f$h ${t}p7_$h
# 下から24行め（24つ前）のファイルをコピーする
h=`tail -n 24 $l | head -n 1`
cp $f$h ${t}p24_$h
# 下から79行め（79つ前）のファイルをコピーする
h=`tail -n 79 $l | head -n 1`
cp $f$h ${t}p79_$h
# 1行目のファイルをコピーする
h=`head -n 1 $l`
cp $f$h $t

# 1行目を最下行へ移動
echo $h >> $l
tail -n +2 $l > p
mv p $l
