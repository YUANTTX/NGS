#!/bin/bash
# title:质控
# author:yhj
# date:2021.10.11
# 



for id in *gz;
do 
	echo `date` "start do QC for " $id
	/home/yuan/software/fastqc/fastqc $id
	echo `date` "end do QC for " $id
done 
