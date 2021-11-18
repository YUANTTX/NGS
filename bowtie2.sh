#!/bin/bash
# title:去除fastq文件中rRNA序列
# author:yhj
# date:2021.10.11
# 

# rRNA索引
hsg38rRNA="/home/yuan/database/index/bowtie2/rRNA/rRNA"

# 1.单端数据
~/bowtie2 -x $hsg38rRNA --un ./input/rmrRNAfq/${fastqid}.fastq -U ./input/cleanfq/${fastqid}.fastq -p 4 -S /dev/null

# 2.双端数据
~/bowtie2 --very-sensitive-local --no-unal -I 1 -X 1000 -p 4 -x $hsg38rRNA -1 ./input/cleanfq/${fastqid}_1.fastq -2 ./input/cleanfq/${fastqid}_2.fastq --un ./input/cleanfq/${fastqid}.fastq -S /dev/null

# 定义 rmrRNA 函数
rmrRNAf (){
fastqfile=`ls input/cleanfq/ | awk -F '[_.]' '{print $1}' | uniq`
for fastqid in $fastqfile
do
       if [ ! -f "./input/cleanfq/${fastqid}_1.fastq" ];then
               /biowork/biosoft/bowtie2/bowtie2 -x $hsg38rRNA --un ./input/rmrRNAfq/${fastqid}.fastq -U ./input/cleanfq/${fastqid}.fastq -p 4 -S /dev/null
       else
               /biowork/biosoft/bowtie2/bowtie2 --very-sensitive-local --no-unal -I 1 -X 1000 -p 4 -x $hsg38rRNA -1 ./input/cleanfq/${fastqid}_1.fastq -2 ./input/cleanfq/${fastqid}_2.fastq --un-conc-gz ./input/cleanfq/${fastqid}.fq.gz -S /dev/null
       fi
       echo "已去除 $fastqid rRNA序列"
done
}
#rmrRNAf
