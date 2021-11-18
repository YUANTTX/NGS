#!/bin/bash
# title:将质控数据整合在一起
# author:yhj
# date:2021.10.11
# 

# multiqc 由python写成。因此需要python环境
# 使用 'pip install multiqc' 进行安装
multiqc -p -pdf ./output/fastqc/* -o ./output/multiqc/
