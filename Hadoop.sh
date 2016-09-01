#!/bin/bash
#hadoop��װ��version1.0��������2016-06-02
#���ߣ����磬QQ��47633065
yum groupinstall "Development Tools"
mkdir -p /home/hadoop
mkdir -p /home/tmp
mkdir -p /home/hdfs
mkdir -p /home/hdfs/data
mkdir -p /home/hdfs/name
cp hadoop-2.6.3.tar.gz /home/hadoop
cp jdk1.8.0_91.tar.gz /home 
cd /home/hadoop
tar -zxvf hadoop-2.6.3.tar.gz
cd ..
tar -zxvf jdk1.8.0_91
source /etc/profile
java -version
ssh -keygen -t rsa
cat id_rsa.pub >> authorized_keys
ssh root@192.168.60.72 cat ~/.ssh/id_rsa.pub >> authorized_keys
ssh root@192.168.60.73 cat ~/.ssh/id_rsa.pub >> authorized_keys
scp id_dsa.pub authorized_keys root@192.168.60.72:/root/.ssh
scp id_dsa.pub authorized_keys root@192.168.60.73:/root/.ssh
scp -r /home/hadoop root@192.168.60.72:/home
scp -r /home/hadoop root@192.168.60.73:/home
cd /home/hadoop/hadoop-2.6.3/sbin/
#��������
./start-all.sh 
#ֹͣ����
./stop-all.sh
jps