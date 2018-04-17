
GRADLE_VERSION=4.6
echo "Installing gradle version: $GRADLE_VERSION"
echo "================ Installing gradle ================="
wget -nv https://services.gradle.org/distributions/gradle-4.6-all.zip
unzip -qq gradle-4.6-all.zip -d /usr/local && rm -f gradle-4.6-all.zip
ln -fs /usr/local/gradle-4.6/bin/gradle /usr/bin
echo 'export PATH=$PATH:/usr/local/gradle-4.6/bin' >> /etc/drydock/.env


APACHE_MAVEN_VERSION=3.5.3
echo "Installing apache-maven version: $APACHE_MAVEN_VERSION"
echo "================ Installing apache-maven-3.5.3 ================="
wget -nv http://redrockdigimark.com/apachemirror/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
tar xzf apache-maven-3.5.3-bin.tar.gz -C /usr/local && rm -f apache-maven-3.5.3-bin.tar.gz
ln -fs /usr/local/apache-maven-3.5.3/bin/mvn /usr/bin
echo 'export PATH=$PATH:/usr/local/apache-maven-3.5.3/bin' >> /etc/drydock/.env


APACHE_ANT_VERSION=1.10.1
echo "Installing apache-ant version: $APACHE_ANT_VERSION"
echo "================ Installing apache-ant-1.10.1 ================="
wget -nv https://archive.apache.org/dist/ant/binarie/apache-ant-1.10.3-bin.tar.gz
tar xzf apache-ant-1.10.3-bin.tar.gz -C /usr/local && rm -f apache-ant-1.10.3-bin.tar.gz
ln -fs /usr/local/apache-ant-1.10.3/bin/ant /usr/bin
echo 'export ANT_HOME=/usr/local/apache-ant-1.10.3' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/local/apache-ant-1.10.3/bin' >> /etc/drydock/.env

for file in /c7javall/version/*.sh;
do
  $file
done

echo "================ Install android sdk & plugin ================"
pushd /tmp

wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
unzip -q sdk-tools-linux-3859397.zip
mkdir -p /opt/android-sdk
mv tools/ /opt/android-sdk/

ln -fs /opt/android-sdk/tools/bin/sdkmanager /usr/bin

export JAVA_HOME=/usr/java/jdk1.8.0_161
export PATH=$PATH=/usr/java/jre1.8.0_161/bin
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK=/opt/android-sdk/tools/bin

mkdir -p ~/.android
touch /root/.android/repositories.cfg
yes | sdkmanager --licenses

echo 'export ANDROID_HOME=/opt/android-sdk' >> /etc/drydock/.env
echo 'export ANDROID_SDK=/opt/android-sdk/tools/bin' >> /etc/drydock/.env

echo 'export PATH=$PATH:/opt/android-sdk/tools/bin' >> /etc/drydock/.env

wget http://central.maven.org/maven2/com/github/triplet/gradle/play-publisher/1.2.0/play-publisher-1.2.0.jar
mkdir -p /opt/android-plugins
mv play-publisher-1.2.0.jar /opt/android-plugins/

popd
