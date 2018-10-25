#!/bin/bash -e

echo "================ Installing openjdk8 ================="
sudo yum install -y java-1.8.0-openjdk-devel

ln -s /usr/java/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/ /usr/lib/jvm/java-8-openjdk-amd64

update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-openjdk-amd64/bin/java 1
update-alternatives --install /usr/bin/java javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac 1
