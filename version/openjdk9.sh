#!/bin/bash -e

echo "================ Installing openjdk9 ================="
wget https://copr.fedorainfracloud.org/coprs/omajid/openjdk9/repo/epel-7/omajid-openjdk9-epel-7.repo
sudo cp omajid-openjdk9-epel-7.repo /etc/yum.repos.d/
sudo yum install -y java-9-openjdk-devel
