#!/usr/bin/sh
#ImageMagick安装，version1.0创建于2016-05-30
yum install -y gcc php-devel php-pear
rpm -Uvh ImageMagick-7.0.1-6.x86_64.rpm
convert --version
#完成
echo "finshed"