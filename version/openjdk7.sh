#!/bin/bash -e

echo "================ Installing openjdk7 ================="
sudo yum install -y java-1.7.0-openjdk-devel

update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.201-2.6.16.1.el7_6.x86_64/bin/java 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.201-2.6.16.1.el7_6.x86_64/bin/javac 1
