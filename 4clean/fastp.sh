#!/bin/bash
# title:去除fastq文件中的接头
# author:yhj
# date:2021.10.11
# 

# 1.单端数据
~/fastp -w 16 -a ATTGATGGTGCCTACAG -i ./input/fastq/${fastqid}.fastq -o ./input/cleanfq/${fastqid}.fastq

# 2.双端数据
~/fastp -w 16 -a ATTGATGGTGCCTACAG -i ./input/fastq/${fastqid}_1.fastq -o ./input/cleanfq/${fastqid}_1.fastq -I ./input/fastq/${fastqid}_2.fastq -O ./input/cleanfq/${fastqid}_2.fastq

# 定义 fastp 函数
fastpf (){
for fastqid in $fastqfile
do
        echo "正在使用fastp去除 $fastqid 接头序列"
        if [ ! -f "./input/fastq/${fastqid}_1.fastq" ];then
                fastp -w 16 -a ${cut3} -i ./input/fastq/${fastqid}.fastq -o ./input/cleanfq/${fastqid}.fastq
        else
                echo "暂时过双端数据"
                fastp -w 16 -a ${cut3} -i ./input/fastq/${fastqid}_1.fastq -o ./input/cleanfq/${fastqid}_1.fastq \
                        -I ./input/fastq/${fastqid}_2.fastq -O ./input/cleanfq/${fastqid}_2.fastq
        fi
        echo "$fastqid 去除完成"
done
}
#fastpf
