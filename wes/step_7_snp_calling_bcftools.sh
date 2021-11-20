#!/bin/bash
# title:snp-calling by bcftools
# author:yhj
# date:2021.10.11
#

reference=/home/jmzeng/ref-database/hg19.fasta  

for i in *.realgn.bam
do
	echo $i
	samtools mpileup -guSDf  $reference  $i | bcftools view -cvNg - > ${i%%.*}.bcftools.vcf
done 
