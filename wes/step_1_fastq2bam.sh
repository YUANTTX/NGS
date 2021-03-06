#!/bin/bash
# title:使用bwa进行比对
# author:yhj
# date:2021.10.11
# 


work_dir=/home/jmzeng/snp-calling
reference=/home/jmzeng/ref-database/hg19.fasta   
bwa_dir=$work_dir/resources/apps/bwa-0.7.11
picard_dir=$work_dir/resources/apps/picard-tools-1.119

while read id
do
	sample=`echo $id |awk '{print $1}'`
	read1=`echo $id |awk '{print $2}'`
	read2=`echo $id |awk '{print $3}'`
	echo $sample 
	echo $read1 
	echo $read2  
	~/bwa mem -t 4 -M $reference $read1 $read2 1> $sample.sam 2>>bwa.log
done <$1
