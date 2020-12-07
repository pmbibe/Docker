#!/bin/bash
yum -y update
yum -y install java-1.8.0-openjdk
regex=$(echo -ne '\n' | update-alternatives --config java | grep 1.8.0 | awk '{print $4}') 
javaHome=$(echo "$regex" | sed -e 's/(//g' -e 's/)//g')
echo "export JAVA_HOME=$javaHome" >> .bash_profile
source .bash_profile
echo "Install Java 8 SUCCESS"