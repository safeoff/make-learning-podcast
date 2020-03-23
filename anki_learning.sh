#!/bin/bash
# Ankiで今日やったカードの英語のmp3をコピーする
#引数1 systemかduo

# パスとか
f="../../Music/"$1"/"
t="../../Music/learning/"
l="../../AnkiDroid/collection.log"

# 2日分のlogを取得
ids=""
day=`date --date '1 day ago' +%s`
IFS=$'\n';
for line in `cat $l | grep mId`
do
	time=${line%%]*}
	time=${time##*[}
	id=${line##*mId\': }
	id=${id%%,*}
	if test $time -gt $day; then
		ids+=" $id"
	fi
done

# カードIDとmp3を対応させる
mp3s=""
IFS=$' ';
for id in $ids
do
	mp3=`grep $id $1map.txt`
	mp3=${mp3##* }
	if [[ $mp3 == *mp3* ]]; then 
		mp3s+="\n"$f$mp3
	fi
done
mp3s=`echo -e $mp3s | sort | uniq`

# mp3をコピー 日付+ファイル名
IFS=$'\n';
new=`date "+%m%d00"`-$1.mp3
cat $mp3s > $t$new
#echo $mp3s
#for mp3 in $mp3s
#do
#	new=`date "+%m%d"`-$mp3
#	cp $f$mp3 $t$new
#done
