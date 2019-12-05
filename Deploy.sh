#!/bin/bash
result=$(awk '{if ($1 == 0 || $1 == 1) print $1}' Docker/result.txt)
if [ $result -eq 0 ]
then
echo "OK"
#rsync -e ssh Docker/source/*.php  --exclude='Docker/source/autoload.php' root@192.168.141.203:/usr/share/nginx/html
pwd
ls
hostname
mv Docker/src/*.php  /usr/share/nginx/html/
else
echo "Failed"
fi
