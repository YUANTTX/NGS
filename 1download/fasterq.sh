#!/bin/bash
# title:SRA文件转为fastq文件
# author:yhj
# date:2021.10.12

# fastq-dump已经不怎么使用用了
fastq-dump  --split-3  $srapath -O ./input/fastq/

# fasterq-dump同样的工具，更为强大
fasterq-dump -e 4 -p --split-3  $srapath -O ./input/fastq/


# 批量循环
for filename in `ls  ./input/sra/`
do
        echo "***正在转换 $filename***"
        srapath="./input/sra/$filename"
        fasterq-dump -e 4 -p --split-3  $srapath -O ./input/fastq/
done
