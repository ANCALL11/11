#!/usr/bin/sh
#GraphicsMagick安装配置，创建于2016-05-30，version1.0
yum -y install libpng-devel libpng libjpeg libjpeg-devel libpng libpng-devel libtiff-devel libtiff libwmf-devel libwmf libxml2-devel libxml2 zlib-devel zlib gd gd-devel bzip2 bzip2-devel libzip-devel libzip
tar -zxvf GraphicsMagick-1.3.23.tar.gz
cd GraphicsMagick-1.3.23
./configure –-prefix=/usr/local/GraphicsMagick-1.3.23 –-disable-static –-enable-openmp –-enable-shared –-enable-symbol-prefix
make 
make install 
gm version
echo "finshed"