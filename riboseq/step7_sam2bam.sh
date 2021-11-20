#!/bin/bash
# @title:sam文件转为bam文件
# @author:yhj
# @date:2021.9.3
# 

hg19="/home/yuan/database/genemous/hg19/hg19.fa"

for i in `ls ./output/sam/ | awk -F '.' '{print $1}'`
do
	echo "$i 正在转换为bam文件"
	# sam文件转bam:
	samtools view -@ 6 -bS  ./output/sam/$i.sam > ./output/bam/$i.bam
	echo "$i.sam 已转为 $i.bam, 开始排序"
	# bam文件sort:
	samtools sort -@ 6 ./output/bam/$i.bam -o  ./output/bamsort/$i.sorted.bam
	echo "$i.bam 已排序为 $i. sort.bam, 开始建立索引"
	# 建立索引:
	samtools index -@ 6 ./output/bamsort/$i.sorted.bam
	echo "$i.sort.bam 已建立索引"
	# 生成bcf文件：
	#samtools mpileup -uf $hg19 ./output/bamsort/$i.sorted.bam | bcftools view -bvcg - > ./output/vcf/$i.bcf
	#echo "$i 突变统计完成"
	echo "\n"
done
