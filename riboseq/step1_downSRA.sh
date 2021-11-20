#!/bin/bash
# @title:下载NCBI SRA数据
# @author:yhj
# @data:2021.9.2
#


## 使用 sratoolkit 软件下载SRA数据
/home/yuan/software/sratoolkit/bin/prefetch --option-file ./SRR_Acc_List.txt  -O ./input/sra/

## 使用 aspare载软件
