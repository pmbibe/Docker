#!/bin/bash
result=$(awk '{if ($1 == 0 || $1 == 1) print $1}' Demo_jenkins/result.txt)
if [ $result -eq 0 ]
then
echo "OK"
#rsync -e ssh Demo_jenkins/source/*.php  --exclude='Demo_jenkins/source/autoload.php' root@192.168.141.203:/usr/share/nginx/html
mv Demo_jenkins/*.php  /usr/share/nginx/html/
else
echo "Failed"
fi
