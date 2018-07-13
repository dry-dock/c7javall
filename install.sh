
GRADLE_VERSION=4.8.1
echo "Installing gradle version: $GRADLE_VERSION"
echo "================ Installing gradle ================="
wget -nv https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip
unzip -qq gradle-$GRADLE_VERSION-all.zip -d /usr/local && rm -f gradle-$GRADLE_VERSION-all.zip
ln -fs /usr/local/gradle-$GRADLE_VERSION/bin/gradle /usr/bin
echo 'export PATH=$PATH:/usr/local/gradle-$GRADLE_VERSION/bin' >> /etc/drydock/.env


APACHE_MAVEN_MAJOR_VERSION=3
APACHE_MAVEN_VERSION=3.5.4
echo "Installing apache-maven version: $APACHE_MAVEN_VERSION"
echo "================ Installing apache-maven-$APACHE_MAVEN_VERSION ================="
wget -nv http://redrockdigimark.com/apachemirror/maven/maven-$APACHE_MAVEN_MAJOR_VERSION/$APACHE_MAVEN_VERSION/binaries/apache-maven-$APACHE_MAVEN_VERSION-bin.tar.gz
tar xzf apache-maven-$APACHE_MAVEN_VERSION-bin.tar.gz -C /usr/local && rm -f apache-maven-$APACHE_MAVEN_VERSION-bin.tar.gz
ln -fs /usr/local/apache-maven-$APACHE_MAVEN_VERSION/bin/mvn /usr/bin
echo 'export PATH=$PATH:/usr/local/apache-maven-$APACHE_MAVEN_VERSION/bin' >> /etc/drydock/.env


APACHE_ANT_VERSION=1.10.4
echo "Installing apache-ant version: $APACHE_ANT_VERSION"
echo "================ Installing apache-ant-$APACHE_ANT_VERSION ================="
wget -nv https://archive.apache.org/dist/ant/binaries/apache-ant-$APACHE_ANT_VERSION-bin.tar.gz
tar xzf apache-ant-$APACHE_ANT_VERSION-bin.tar.gz -C /usr/local && rm -f apache-ant-$APACHE_ANT_VERSION-bin.tar.gz
ln -fs /usr/local/apache-ant-$APACHE_ANT_VERSION/bin/ant /usr/bin
echo 'export ANT_HOME=/usr/local/apache-ant-$APACHE_ANT_VERSION' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/local/apache-ant-$APACHE_ANT_VERSION/bin' >> /etc/drydock/.env


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

export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64 
export PATH=$PATH=/usr/java/jre1.8.0_171-amd64/bin
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
