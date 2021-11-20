#!/bin/bash
# title:Merge individual BAM files
# author:yhj
# date:2021.10.11
#


samtools merge sampe.merged.bam  *.realgn.bam
samtools index sampe.merged.bam
