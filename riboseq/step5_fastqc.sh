#!/bin/bash
# @title:质控
# @anthor:yhj
# @date:2021.9.3
#


for i in `ls ./input/rmrRNAfq/*.fastq`
do
  echo "统计 $i 序列信息"
  /home/yuan/software/fastqc/fastqc -t 6 $i -o ./output/fastqc/
  echo "$i 统计完成"
done
multiqc -p -pdf ./output/fastqc/* -o ./output/multiqc/
