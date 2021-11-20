#!/bin/bash
# @title:SRA文件转为fastq文件
# @author:yhj
# @date:2021.9.2
#

for filename in `ls  ./input/sra/`
do 
  echo "正在转换 $filename"
  srapath="./input/sra/$filename/$filename.sra"
  /home/yuan/software/sratoolkit/bin/fastq-dump --split-3 $srapath -O ./input/fastq/
  echo "$filename 转换完成"
  echo "\n"
done

echo "所有文件转换完成"
