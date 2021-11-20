#!/bin/bash
# @title:去除fastq文件中rRNA序列
# @author:yhj
# @date:2021.9.5
#


hsg38rRNA="/home/yuan/database/index/bowtie2/rRNA/rRNA"


fastqfile=`ls input/cleanfq/ | awk -F '[_.]' '{print $1}' | uniq`
for fastqid in $fastqfile
do
       if [ ! -f "./input/cleanfq/${fastqid}_1.fastq" ];then
               /home/yuan/software/bowtie2/bowtie2 -x $hsg38rRNA --un ./input/rmrRNAfq/${fastqid}.fastq -U ./input/cleanfq/${fastqid}.fastq -p 6 -S ./input/rmrRNAfq/${fastqid}.sam
       else
	       echo "双端跳过"
#               /biowork/biosoft/bowtie2/bowtie2 --very-sensitive-local --no-unal -I 1 -X 1000 -p 6 -x $hsg38rRNA \
#                       -1 ./input/cleanfq/${fastqid}_1.fastq -2 ./input/cleanfq/${fastqid}_2.fastq --un-conc-gz ./input/cleanfq/${fastqid}.fq.gz
       fi
       echo "已去除 $fastqid 核糖体序列"
done
