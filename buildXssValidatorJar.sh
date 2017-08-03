#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# buildXssValidatorJar.sh
#
# Install xssValidator
#
# Usage: bash buildXssValidatorJar.sh
#
# Author: Jayson Grace, jayson.e.grace@gmail.com, 9/5/2016
#
# Last update 8/3/2017 by Jayson Grace, jayson.e.grace@gmail.com
# -----------------------------------------------------------------------------
if [[ `uname` != 'Darwin' ]]; then
  os=`cat /etc/os-release | perl -n -e'while(/^ID=(.*)/g) {print "$1\n"}'`
  if [[ $os == 'debian' ]] || [[ $os == 'kali' ]] || [[ $os == 'ubuntu' ]]; then
    apt-get update
    apt-get install -y ant phantomjs
  fi
fi

cd /opt
git clone https://github.com/l50/xssValidator.git
cd xssValidator
mkdir ./burp-extender/lib
cd burp-extender/lib

# Download libs
wget http://central.maven.org/maven2/commons-codec/commons-codec/1.6/commons-codec-1.6.jar
wget http://central.maven.org/maven2/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar
wget http://central.maven.org/maven2/org/apache/httpcomponents/fluent-hc/4.3.6/fluent-hc-4.3.6.jar
wget http://central.maven.org/maven2/org/apache/httpcomponents/httpclient/4.3.6/httpclient-4.3.6.jar
wget http://central.maven.org/maven2/org/apache/httpcomponents/httpclient-cache/4.3.6/httpclient-cache-4.3.6.jar
wget http://central.maven.org/maven2/org/apache/httpcomponents/httpcore/4.3.3/httpcore-4.3.3.jar
wget http://central.maven.org/maven2/org/apache/httpcomponents/httpmime/4.3.6/httpmime-4.3.6.jar

cd ../bin/burp
# Build the jar
ant
