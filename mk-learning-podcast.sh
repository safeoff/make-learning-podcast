#!/bin/bash
# リストに書かれたファイルを順番にコピーする

# パスとか
f="../../Music/system/"
t="../../Music/learning/"
l="list.txt"

# 下からn行め（nつ前）のファイルをコピーする
#ns="1 2 3 5 8 13 21 34 55 89 144 233 377 610"
#ns="1 2 3 5 8"
ns=`f=0 s=1; for ((;f+s<12;)); do t=$((f+s)) f=$s s=$t; echo -n $t\ ; done;`
for n in $ns
do
	h=`tail -n $n $l | head -n 1`
	cp $f$h ${t}p${n}_$h
done

# 1行目のファイルをコピーする
h=`head -n 1 $l`
cp $f$h $t

# 1行目を最下行へ移動
echo $h >> $l
tail -n +2 $l > p
mv p $l
