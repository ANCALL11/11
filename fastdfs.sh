#!/bin/bash
#fastdfs+nginx+module安装，创建于2016-05-30
#verion 2.0
yum -y install epel-release*
yum groupinstall -y "Development Tools"
yum -y install libevent-devel pcle-devel zlib-devel
tar -zxvf FastDFS_4.06.tar.gz
if [ -d '/home/fastdfs' ]
   then
      mkdir -p /home/fastdfs
fi
cd FastDFS
nl make.sh | sed 's/#WITH_LINUX_SERVICE=1/WITH_LINUX_SERVICE=1/g' make.sh
./make.sh
./make.sh install
cd /etc/fdfs/
if [ -d '/home/fastdfs' ]
 then 
   mkdir -p /home/fastdfs
fi
#nl /etc/fdfs/tracker.conf | sed 's/\/yuqing//\/g' tracker.conf
#nl /etc/fdfs/tracker.conf | sed 's/##include http.conf/#include http.conf/g' tracker.conf
if [ -d '/home/fastdfs/stoage1/' ]
then
 mkdir -p /home/fastdfs/stoage1/
fi
systemctl start fdfs_trackerd
tar -zxvf nginx-1.10.0.tar.gz
tar -zxvf fastdfs-nginx-module_v1.16.tar.gz
cd nginx-1.10.0
./configure --prefix=/usr/local/nginx --add-module=/root/fastdfs-nginx-module/src
make && make install 
cp /root/fastdfs-nginx-module/src/mod_fastdfs.conf /etc/fdfs
ln -s /home/data /home/fastdfs/data/M00
systemctl restart fdfs_storaged
#启动nginx
/usr/local/nginx/sbin/nginx
#上传
/usr/local/bin/fdfs_test /etc/fdfs/clint.conf upload test.txt
#访问文件
#curl http://192.168.60.71:8080/group1/M00/00/00/wKg8R1dEmOrCzEAwAAAADijluYQ352_big.txt
#完成
echo "done"