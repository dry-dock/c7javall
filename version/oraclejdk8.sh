#!/bin/bash -e

echo "================ Installing oracle-java8 ================="
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jdk-8u192-linux-x64.rpm"
sudo yum localinstall -y jdk-8u192-linux-x64.rpm

ln -s /usr/java/jdk1.8.0_192-amd64/ /usr/lib/jvm/java-8-oraclejdk-amd64
update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oraclejdk-amd64/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oraclejdk-amd64/bin/javac 1
