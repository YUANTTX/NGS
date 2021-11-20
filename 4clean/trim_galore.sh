#!/bin/bash
# title:去除fastq文件中的接头
# author:yhj
# date:2021.10.11
# 

# 接头文件
adapt='ATTGATGGTGCCTACAG'

# 1.单端数据
trim_galore -w 16 -a ${adapt} -i ./input/fastq/${fastqid}.fastq -o ./input/cleanfq/${fastqid}.fastq

# 2.双端数据

# 定义 trim_galore 函数
trim_galoref (){
for fastqid in $fastqfile
do
        echo "正在使用trim_galoref去除 $fastqid 接头序列"
        if [ ! -f "./input/fastq/${fastqid}_1.fastq" ];then
                trim_galore -w 16 -a ${adapt} -i ./input/fastq/${fastqid}.fastq -o ./input/cleanfq/${fastqid}.fastq
        else
                echo "暂时过双端数据"
        fi
        echo "$fastqid 去除完成"
done
}
#trim_galoref
