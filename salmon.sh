#!/bin/bash
# @title: 使用salmon比对
# @author:yhj
# @date:2021.10.11
#


# 1.单端比对：
/home/yuan/software/salmon/bin/salmon quant -l MU -i /home/yuan/index/salmon/human/ --validateMappings -r  /home/yuan/data/encode/ENCFF372SLD.fastq.gz -o /home/yuan/Tmp/
# 2.双端比对：
/home/yuan/software/salmon/bin/salmon quant -l MU -i /home/yuan/index/salmon/human/ --validateMappings -r  /home/yuan/data/encode/ENCFF372SLD.fastq.gz -o /home/yuan/Tmp/

# 定义 salmon 函数
salmonf (){
        for i in `ls input/rmrRNA/`;
        do
                echo ""
        done

}
#salmonf
