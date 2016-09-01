#!/bin/bash
#redis安装，version1.0，创建于2016-05-31
#作者：二哥，QQ：47633065
#解压
tar -zxvf tar -zxvf redis-3.2.0.tar.gz
#编译安装
cd redis-3.2.0
make 
make install
cp redis.conf /etc/
chmod a+x /etc/redis.conf
#调用所有资源运行
echo vm.overcommit_memory=1 >> /etc/systl.conf
echo 1 > /proc/sys/vm/overcommit_memory
sysctl -p
#开启服务
cd /usr/local/bin
./redis-server /etc/redis.conf
echo "done"