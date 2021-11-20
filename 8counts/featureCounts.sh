#!/bin/bash
# title:计算counts值
# author:yhj
# date:2021.10.11
# 


hg38gtf="/biowork/genomes/hg38/gencode.v38.annotation.gtf"
hg19gtf="/biowork/genomes/hg19/hg19.v37.annotation.gtf"

# 1.单端数据
featureCounts -g gene_id -a $hg19gtf -T 4  -o ./output/counttmp/${i}_featureCounts.txt ./output/sam/${i}.sam

# 2.双端数据
featureCounts -g gene_id -a $hg19gtf -T 4 -p  -o ./output/counttmp/${i}_featureCounts.txt ./output/sam/$i.sam


#定义FeatureCounts函数
featcountf (){
        mkdir ./output/counttmp
        for i in `ls ./output/sam/ | awk -F '.' '{print $1}'`
        do
                echo "正在计算 $i counts值"
                featureCounts -g gene_id -a $hg19gtf -T 8  -o ./output/counttmp/${i}_featureCounts.txt ./output/sam/${i}.sam
        if [ $? -eq 0 ]; then
                echo "$i counts计算完成"
        else
                featureCounts -g gene_id -a $hg19gtf -T 8 -p  -o ./output/counttmp/${i}_featureCounts.txt ./output/sam/$i.sam
                echo "$i counts计算完成"
        fi
        sed -i '1d'  ./output/counttmp/${i}_featureCounts.txt
        sed -i -e  "s/\.\/output\/sam\///1" -e "s/\.sam//1" ./output/counttmp/${i}_featureCounts.txt
        cut -f 1,7 ./output/counttmp/${i}_featureCounts.txt > ./output/counts/${i}_featureCounts.txt
        done

        #将单个counts数据合并成矩阵
        paste ./output/counts/*_featureCounts.txt > ./output/counttmp/counts.tmp.txt
        awk '{OFS="\t";for(i=3;i<=NF;i=i+2){ $i=null };print $0 }' ./output/counttmp/counts.tmp.txt > ./output/finall/Riboseq.featureCounts.all.counts.txt
        sed -i "s/\t\t/\t/g" ./output/finall/Riboseq.featureCounts.all.counts.txt
        rm -rf ./output/counttmp
}
#featcountf
