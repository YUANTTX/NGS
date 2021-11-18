#!/bin/bash
# title:去除fastq文件中的接头
# author:yhj
# date:2021.10.11
# 

# 截取序列  CROP:保留reads到30bp, HEADCROP:在首端切除6bp, 最小长度20bp, 最终保留24bp。

# 1.单端数据
java -jar /biowork/biosoft/Trimmomatic/trimmomatic-0.39.jar SE -threads 4 ./input/fastq/${fastqid}.fastq ./input/cleanfq/${fastqid}.fastq CROP:30 HEADCROP:6 MINLEN:20

# 2.双端数据


# 定义 Trimmomatic 函数
Trimmomaticf (){
for fastqid in $fastqfile
do
        echo "正在Trimmomatic去除 $fastqid 接头序列"
        if [ ! -f "./input/fastq/${fastqid}_1.fastq" ];then
                java -jar /biowork/biosoft/Trimmomatic/trimmomatic-0.39.jar SE -threads 4 \
                        ./input/fastq/${fastqid}.fastq  \
                        ./input/cleanfq/${fastqid}.fastq \
                        CROP:30 HEADCROP:6 MINLEN:20
        else
                echo "暂时过双端数据"
        fi
        echo "$fastqid 去除完成"
done
}
#Trimmomaticf
