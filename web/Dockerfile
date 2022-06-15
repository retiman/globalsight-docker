# syntax=docker/dockerfile:1.4
#
# Ubuntu 15.04 doesn't work; GlobalSight docs claim that only 14.04 is supported.
#
# See http://www.globalsight.com/wiki/index.php/Installing_GlobalSight_on_Ubuntu
FROM ubuntu:14.04 as builder
WORKDIR /app
COPY run.sh /home/jboss/run.sh
COPY wait-for-it.sh /home/jboss/wait-for-it.sh
ENV CLASSPATH=".:lib/commons-codec-1.3.jar:installer.jar:lib/ant.jar:lib/log4j.jar"
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
RUN <<EOF
# Java 8 is required according to GlobalSight docs; specifically, Oracle JDK 8.  Unfortunately, that version requires
# accepting a license agreement for downloading.  Instead we use OpenJDK 8 with some workarounds.
apt-get install -y software-properties-common
add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
apt-get install -y mysql-client openjdk-8-jdk p7zip-full wget

# 7z is more convenient to use here instead of jar or zip as the instructions suggest as the GlobalSight zip file
# contains a few errors, and both jar and unzip will produce errors during the unzip process. 7zip will silently ignore
# errors during the unzip process.
wget --no-check-certificate https://sourceforge.net/projects/globalsight/files/GlobalSight_Software/GlobalSight_8.7.3/GlobalSight_Software_Package_Linux_8.7.3.zip/download -O gs.zip
7z x gs.zip
rm -f gs.zip

# Because GlobalSight relies on internal Sun APIs that aren't available in OpenJDK 8, we'll have to grab the aixport jar
# that contains the restricted APIs and add them to the JVM installation directory.
#
# Without this jar, GlobalSight starts with a NoClassDefFoundException: com/sun/org/apache/regexp/internal/RESyntaxException
wget --no-check-certificate https://repo1.maven.org/maven2/javax/xml/parsers/aixport/1.3.1/aixport-1.3.1.jar -O aixport-1.3.1.jar
mv aixport-1.3.1.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/aixport-1.3.1.jar

useradd -m -s /bin/bash jboss

# Install GlobalSight in the /home/jboss/globalsight directory.
mkdir -p /home/jboss/globalsight
cd /home/jboss/globalsight
jar xvf /app/GlobalSight/GlobalSight.zip
chmod u+x install/Install.sh
chmod u+x jboss/server/bin/standalone.sh
chmod u+x jboss/server/bin/jboss-cli.sh
chmod u+x /home/jboss/run.sh
chmod u+x /home/jboss/wait-for-it.sh

mkdir -p docs
mkdir -p filestorage
mkdir -p winfiles

chown -R jboss:jboss /home/jboss

# Remove temporary files for installation.
apt-get remove -y p7zip-full software-properties-common wget
apt-get autoremove -y
EOF

WORKDIR /home/jboss
CMD ./run.sh
