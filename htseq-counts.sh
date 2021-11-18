#!/bin/bash
# title:htseq-counts计算counts值
# author:yhj
# date:2021.10.11
# 


hg38gtf="/biowork/genomes/hg38/gencode.v38.annotation.gtf"
hg19gtf="/biowork/genomes/hg19/hg19.v37.annotation.gtf"

# 1.单端数据
htseq-count  -f bam -r pos -s no -i gene_id  ./output/bamsort/${i}.sorted.bam $hg19gtf  1>./output/counts/${i}.HTseq.count.txt 2>./output/counts/${i}.HTseq.txt.log

# 2.双端数据
htseq-count  -f bam -r pos -s no -i gene_id  ./output/bamsort/${i}.sorted.bam $hg19gtf  1>./output/counts/${i}.HTseq.count.txt 2>./output/counts/${i}.HTseq.txt.log

#定义htseq-counts函数
htcountf (){
	mkdir ./output/counttmp
	for i in `ls ./output/sam/ | awk -F '.' '{print $1}'`
	do
        	echo "正在计算 $i counts值"
        	htseq-count  -f bam -r pos -s no -i gene_id  ./output/bamsort/${i}.sorted.bam $hg19gtf  1>./output/counts/${i}.HTseq.count.txt 2>./output/counts/${i}.HTseq.txt.log
        if [ $? -eq 0 ]; then
                echo "$i counts计算完成"
        else
                htseq-count  -f bam -r pos -s no -i gene_id  ./output/bamsort/${i}.sorted.bam $hg19gtf  1>./output/counts/${i}.HTseq.count.txt 2>./output/counts/${i}.HTseq.txt.log
                echo "$i counts计算完成"
        fi
	done
	rm output/counts/*.log
	rm -rf ./output/counttmp
}
#htcountf
