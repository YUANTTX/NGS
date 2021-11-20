#!/bin/bash
# title:
# author:yhj
# date:2021.10.11
#

reference=/home/jmzeng/ref-database/hg19.fasta  

for i in *.realgn.bam
do
	echo $i
	nohup samtools mpileup -f $reference $i 1>${i%%.*}.mpileup.txt 2>${i%%.*}.mpileup.log & 
done
