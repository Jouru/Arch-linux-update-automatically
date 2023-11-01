#!/usr/bin/zsh
ls $1 > .names.txt
vim .names.txt
names=.names.txt

while read -u 9 filename ; do  
    read -u 8 newname 
    mv "$filename" "$newname" 
done 9<<<"$(ls $1)" 8< $names

rm .names.txt
