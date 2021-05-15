#!/bin/bash

#定义时间变量

datetime=$(date +%Y%m%d%H%M)

#按照时间创建目录

mkdir /usr/local/paperspigot-1.12.2/backup/mc${datetime}/

#将服务端目录的东西（即包括存档在内的文件）备份过来

cp -r -f /usr/local/paperspigot-1.12.2/server* /usr/local/paperspigot-1.12.2/backup/mc${datetime}/

#统计该备份的大小，并写入指定目录下的size.txt文件里

du -sm /usr/local/paperspigot-1.12.2/backup/mc${datetime}/ >> /usr/local/paperspigot-1.12.2/backup/size.txt

#压缩成zip文件，并删除目录

zip -r -q /usr/local/paperspigot-1.12.2/backup/mc${datetime}.zip /usr/local/paperspigot-1.12.2/backup/mc${datetime}/

rm -rf /usr/local/paperspigot-1.12.2/backup/mc${datetime}/

#删除一周前的备份

deldate=`date -d '-7 day' +%Y%m%d`

rm -rf /usr/local/paperspigot-1.12.2/backup/mc${deldate}*