#!/bin/bash
# リストに書かれたファイルを順番にコピーする

# パスとか
f="../../Music/"$1"/"
t="../../Music/learning/"
l=$1".txt"

# 下からn行め（nつ前）のファイルをコピーする
# 1 2 3 4 5 6 8 10 13 17 22 29 38 50 66 88 117 156 208 277 369 492 656 874
c=`tail -n 1 $l`
c=${c% *}
ns=`echo -n '1 2 3 4 '; s=5; for ((;s<$c;)); do echo -n $s\ ;s=$((s*4/3)); done;`
for n in $ns
do
	h=`tail -n $n $l | head -n 1`
	h=${h#* }
	echo $h
	cp $f$h ${t}p${n}_$h
done

# 1行目のファイルをコピーする
h=`head -n 1 $l`
cp $f${h#* } $t

# 1行目を最下行へ移動
echo $h >> $l
tail -n +2 $l > p
mv p $l
