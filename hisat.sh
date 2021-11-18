#!/bin/bash
# @title: 使用hisat2比对
# @author:yhj
# @date:2021.10.11
#


# 1.单端比对：
~/hisat2 -q -x /home/yuan/database/index/hisat2/hg19/hg19 -U ./input/rmrRNAfq/reads1.fastq -S ./output/sam/reads1.sam
# 2.双端比对：
~/hisat2 -q -x /home/yuan/database/index/hisat2/hg19/hg19 -1 ./input/rmrRNAfq/reads_1.fastq -2 ./input/rmrRNAfq/reads_2.fastq -S ./output/sam/reads.sam

# 定义 hisat2 函数
hisat2f (){
	for i in `ls input/rmrRNA/`;
	do
		echo ""
	done

}
#hisat2f
