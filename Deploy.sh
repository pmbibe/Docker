#!/bin/bash
result=$(awk '{if ($1 == 0 || $1 == 1) print $1}' ./result.txt)
if [ $result -eq 0 ]
then
echo "OK"
hostname
#rsync -e ssh ./src/*.php  --exclude='.src/autoload.php' root@192.168.141.203:/usr/share/nginx/html
#mv ./src/*.php  /usr/share/nginx/html/
else
echo "Failed"
fi
