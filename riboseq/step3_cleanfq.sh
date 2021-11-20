#!/bin/bash
# @title:去除fastq文件中的接头
# @author:yhj
# @date:2021.9.5
#


#接头序列
#/opt/biosoft/TrimGalore/trim_galoreT

cut3="ATTGATGGTGCCTACAG"

fastqfile=`ls input/fastq/ | awk -F '[_.]' '{print $1}' | uniq`
for fastqid in $fastqfile
do
	echo "正在去除 $fastqid 街头序列"
	if [ ! -f "./input/fastq/${fastqid}_1.fastq" ];then
		/home/yuan/software/fastp/fastp -w 16 -a  ATTGATGGTGCCTACAG -i ./input/fastq/${fastqid}.fastq -o ./input/cleanfq/${fastqid}.fastq
        else
		echo "跳过双端数据"
		#/biowork/biosoft/fastp/fastp -w 16 -a ${cut3} -i \
		#	./input/fastq/${fastqid}_1.fastq -o ./input/cleanfq/${fastqid}_1.fastq \
		 #      	-I ./input/fastq/${fastqid}_2.fastq -O ./input/cleanfq/${fastqid}_2.fastq
        fi
	echo "已去除 $fastqid 接头"
done

##Trimmomatic截取序列
#java -jar /biowork/biosoft/Trimmomatic/trimmomatic-0.39.jar SE -threads 30 ./input/fastq/${fastqid}.fastq  ./input/cleanfq/${fastqid}.fastq CROP:30 HEADCROP:6
