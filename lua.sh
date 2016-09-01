#!/bin/bash
#lua安装创建于2016-05-30，version1.0
#作者：二哥  QQ：47633065
yum -y install readline-devel ncurses-devel
tar -zxvf lua-5.3.2.tar.gz
cd lua-5.3.2
./configure
make 
make install
echo "finshed"