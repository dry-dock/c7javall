#!/bin/bash -e

echo "================ Installing openjdk7 ================="
sudo yum install -y java-1.7.0-openjdk-devel

update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.191-2.6.15.4.el7_5.x86_64/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.191-2.6.15.4.el7_5.x86_64/bin/javac 1
