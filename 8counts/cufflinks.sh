#!/bin/bash
# title:cufflinks统计counts值
# author:yhj
# date:2021.10.11
# 


hg38gtf="/biowork/genomes/hg38/gencode.v38.annotation.gtf"
hg19gtf="/biowork/genomes/hg19/hg19.v37.annotation.gtf"

# 1.单端数据
cufflinks -p 4 -G $hg19gtf --library-type fr-unstranded -o ./output/counts/*.cufflinks.txt ./input/sortbam/*.sorted.bam

# 2.双端数据


#定义cufflinks函数
cufflinksf (){
	mkdir ./output/counttmp
	for i in `ls ./output/sam/ | awk -F '.' '{print $1}'`
	do
        	echo "正在使用cufflinks统计 $i counts"
        	cufflinks -p 4 -G $hg19gtf --library-type fr-unstranded -o ./output/counts/*.cufflinks.txt ./input/sortbam/*.sorted.bam
        if [ $? -eq 0 ]; then
                echo "$i counts计数完成"
        else
		cufflinks -p 4 -G $hg19gtf --library-type fr-unstranded -o ./output/counts/*.cufflinks.txt ./input/sortbam/*.sorted.bam
		echo "$i counts计数完成"
        fi
	done
	rm output/counts/*.log
	rm -rf ./output/counttmp
}
#cuflinksf
