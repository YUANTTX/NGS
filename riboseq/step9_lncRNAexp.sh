#!/bin/bash
# 提取lncRNA表达
#

# 提取lncRNA ID信息
grep 'lncRNA' /home/yuan/database/genomes/hg19/hg19.ensembol_type.gtf | sort > output/finall/sort_lncRNA.gtf

# 提取lncRNA 表达信息
sort output/finall/Riboseq.all.counts.txt > output/finall/sort_counts.txt
join  output/finall/sort_lncRNA.gtf output/finall/sort_counts.txt > output/finall/Riboseq.lncRNA.exp.txt

# 表达矩阵添加表头
count_head=`head -1 output/finall/Riboseq.all.counts.txt | awk '$1=$1" type"'`
sed -i "1 i $count_head" output/finall/Riboseq.lncRNA.exp.txt
sed -i "s/ /\t/g" output/finall/Riboseq.lncRNA.exp.txt

rm output/finall/sort_*
