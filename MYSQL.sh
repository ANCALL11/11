#!/bin/bash
#作者:二哥 version_v1.0
#源码安装MYSQL
#首先安装cmake
tar -zxvf cmake-3.5.2.tar.gz
cd cmake-3.5.2
./configure
make 
make install
#创建mysql目录以及数据存放目录
mkdir -p /usr/local/mysql
mkdir -p /usr/local/mysql/data
#创建mysql用户以及用户组
groupadd mysql
useradd -r -g mysql mysql
#设置目录权限
cd /usr/local/mysql
chown -R root:mysql .
chown -R mysql:mysql data
#安装mysql
tar -zxvf mysql-5.6.23.tar.gz
cd mysql-5.6.23
time cmake ./ -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/usr/local/mysql/data -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=all -DENABLED_LOCAL_INFILE=1
make
make install
#添加mysql到服务器系统中
cp support-files/my-medium.cnf /etc/my.cnf
#创建系统数据库表
cd /usr/local/mysql
scrpts/mysql_install_db --user=mysql
#启动mysql
cd /usr/local/mysql
(./bin/mysqld_safge --usr=mysql & )
#关闭mysql mysqladmin -u root -p shutdown