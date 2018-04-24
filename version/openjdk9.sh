#!/bin/bash -e

echo "================ Installing openjdk9 ================="
wget https://copr.fedorainfracloud.org/coprs/omajid/openjdk9/repo/epel-7/omajid-openjdk9-epel-7.repo
sudo cp omajid-openjdk9-epel-7.repo /etc/yum.repos.d/
sudo rpm --import https://copr-be.cloud.fedoraproject.org/results/omajid/openjdk9/pubkey.gpg
sudo yum install -y java-9-openjdk-devel
