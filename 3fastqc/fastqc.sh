#!/bin/bash
# title:质控
#


for i in `ls ./input/rmrRNAfq/*.fastq`
do
  echo "正在统计 $i"
  /biowork/biosoft/fastqc/fastqc -t 4 -q $i -o ./output/fastqc/
  echo " $i 统计完成"
done
