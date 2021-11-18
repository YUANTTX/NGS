#!/bin/bash
# title:sam文件转为bam文件
# author:yhj
# date:2021.10.11
# 

hg19="/home/yuan/database/genomes/hg19/hg19.fa"

# 1.sam->bam
samtools view -@ 4 -bS  ./output/sam/$i.sam > ./output/bam/$i.bam

# 2.bam->sort.bam
samtools sort -@ 4 ./output/bam/$i.bam -o  ./output/bamsort/$i.sorted.bam

# 3.sort.bam->bam.sai
samtools index -@ 4 ./output/bamsort/$i.sorted.bam

# 4.bcf统计:数据特别大注意空间。
samtools mpileup -uf $hg19 ./output/bamsort/$i.sorted.bam | bcftools view -bvcg - > ./output/vcf/$i.bcf


# samtool循环
for i in `ls ./output/sam/ | awk -F '.' '{print $1}'`
do
	echo "$i 正在转换"
	samtools view -@ 4 -bS  ./output/sam/$i.sam > ./output/bam/$i.bam
	samtools sort -@ 4 ./output/bam/$i.bam -o  ./output/bamsort/$i.sorted.bam
	samtools index -@ 4 ./output/bamsort/$i.sorted.bam
	# 生成bcf文件：
	#samtools mpileup -uf $hg19 ./output/bamsort/$i.sorted.bam | bcftools view -bvcg - > ./output/vcf/$i.bcf
	echo "$i 统计完成"
done
