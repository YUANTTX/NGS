#!/bin/bash

# @title:计算counts值
# @author:yhj
# @date:2021.9.3
# 


hg38gtf="/home/yuan/database/genomes/hg38/gencode.v38.annotation.gtf"
hg19gtf="/home/yuan/database/genomes/hg19/hg19.v37.annotation.gtf"


#使用FeatureCounts计算
mkdir ./output/counttmp
for i in `ls ./output/sam/ | awk -F '[.]' '{print $1}'`
do
	echo "正在计算 $i counts值..."
	/home/yuan/software/subread/bin/featureCounts -g gene_id -a $hg19gtf -T 6  -o ./output/counttmp/$i.txt ./output/sam/$i.sam
	if [ $? -eq 0 ]; then
		echo "$i counts计算完成"
	else
		#/home/yuan/software/subread/bin/featureCounts -g gene_id -a $hg19gtf -T 30 -p  -o ./output/counttmp/$i.txt ./output/sam/$i.sam
		echo "$i counts计算完成"
	fi
	sed -i '1d'  ./output/counttmp/$i.txt
	sed -i "s/\.\/output\/sam\///1" ./output/counttmp/$i.txt
	sed -i "s/\.sam//1" ./output/counttmp/$i.txt
	cut -f 1,7 ./output/counttmp/$i.txt > ./output/counts/$i.txt

done

#合并成矩阵
paste ./output/counts/*.txt > ./output/counttmp/counts.tmp.txt
awk '{OFS="\t";for(i=3;i<=NF;i=i+2){ $i=null };print $0 }' ./output/counttmp/counts.tmp.txt > ./output/finall/Riboseq.all.counts.txt
sed -i "s/\t\t/\t/g" ./output/finall/Riboseq.all.counts.txt
rm -rf ./output/counttmp

#使用Htseq计算counts
#for i in `ls ./output/bamsort/ | awk -F '[.]' '{print $1}' | uniq`
#do
#        echo "正在计算 $i counts值..."
#	htseq-count  -f bam -r pos -s no -i gene_id  ./output/bamsort/${i}.sorted.bam $hg38gtf  1>./output/counts/${i}.HTseq.counts.txt 2>./output/counts/${i}.HTseq.counts.log
#        if [ $? -eq 0 ]; then
#                echo "$i counts计算完成"
#        else
		#htseq-count  -f bam -r pos -s no -i gene_id  ./output/bamsort/${i}.sorted.bam $hg19gtf  1>./output/counts/${i}.HTseq.counts.txt 2>./output/counts/${i}.HTseq.counts.log
#	       	echo "$i counts计算完成"
#        fi
#done


