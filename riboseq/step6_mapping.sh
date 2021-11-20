#!/bin/bash
# @title:序列比对
# @author：yhj
# @date:2021.9.3
#

bowtie2="/home/yuan/software/bowtie2/bowtie2"
bowindex="/home/yuan/database/index/bowtie2/hg19/hg19"
bwa="/home/yuan//software/bwa/bwa"
bwaindex="/home/yuan/database/index/bwa/hg19/hg19"
star="home/yuan/software/star/bin/star"
staindex="home/yuan/database/index/star/"


for i in `ls ./input/rmrRNAfq/ | awk -F '[._]' '{print $1}' | uniq`
do
	echo "正在比对 $i "
	if [ ! -f "./input/rmrRNAfq/$1_.fastq" ];then
		#$bowtie2 -p 6 -x $bowindex -U ./input/rmrRNAfq/$i.fastq -S ./output/sam/$i.sam
		$bwa mem -t 6 ${bwaindex} ./input/rmrRNAfq/${i}.fastq > ./output/sam/${i}.sam
		#$star
	else
		#$bowtie2 -p 6 -x $bowindex -1 ./input/rmrRNAfq/$i_1.fastq -2 ./input/cleanfq/$i_2.fastq -S ./output/sam/$i.sam
		$bwa mem -t 6 ${bwaindex} ./input/rmrRNAfq/${i}_1.fastq ./input/rmrRNAfq/${i}_2.fastq > ./output/sam/${i}.sam
	fi
	echo "$i 比对完成"
done
