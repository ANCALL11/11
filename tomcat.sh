#!/bin/bash
#��װtomcat version_1.0 ������2016-06-02
#���ߣ�����   QQ��47633065
yum -y groupinstall "Development Tools"
cd /usr/local
wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz
tar -zxvf apache-tomcat-7.0.69.tar.gz
mv apache-tomcat-7.0.69 tomcat
cd /usr/local/tomcat/bin/
./startup.sh
#./startdown.sh