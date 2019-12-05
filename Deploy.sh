#!/bin/bash
result=$(awk '{if ($1 == 0 || $1 == 1) print $1}' Jenkins_Dockerfile/result.txt)
if [ $result -eq 0 ]
then
echo "OK"
hostname
#rsync -e ssh Docker/source/*.php  --exclude='Docker/source/autoload.php' root@192.168.141.203:/usr/share/nginx/html
#mv Jenkins_Dockerfile/*.php  /
else
echo "Failed"
fi
