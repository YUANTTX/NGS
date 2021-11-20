#!/bin/bash
# @title: 使用star比对
# @author:yhj
# @date:2021.10.11
#


# 1.单端比对：
/home/yuan/software/star/bin/STAR --twopassMode Basic --quantMode TranscriptomeSAM GeneCounts --runThreadN 4 --genomeDir /home/yuan/database/index/star/hg38/ --alignIntronMin 20 --alignIntronMax 50000 --outSAMtype BAM SortedByCoordinate --sjdbOverhang 100 --outSAMattrRGline ID:sample SM:sample PL:ILLUMINA --outFilterMismatchNmax 2 --outSJfilterReads Unique --outSAMmultNmax 1 --outFileNamePrefix ./output/sam/ --outSAMmapqUnique 60  --readFilesIn  ./input/rmrRNAfq//SRR12458657_1.fastq ./input/rmrRNAfq/SRR12458657_2.fastq
# 2.双端比对：
/home/yuan/software/star/bin/STAR --twopassMode Basic --quantMode TranscriptomeSAM GeneCounts --runThreadN 4 --genomeDir /home/yuan/database/index/star/hg38/ --alignIntronMin 20 --alignIntronMax 50000 --outSAMtype BAM SortedByCoordinate --sjdbOverhang 100 --outSAMattrRGline ID:sample SM:sample PL:ILLUMINA --outFilterMismatchNmax 2 --outSJfilterReads Unique --outSAMmultNmax 1 --outFileNamePrefix ./output/sam/ --outSAMmapqUnique 60  --readFilesIn  ./input/rmrRNAfq//SRR12458657_1.fastq ./input/rmrRNAfq/SRR12458657_2.fastq

# 定义 star 函数
starf (){
        for i in `ls input/rmrRNA/`;
        do
                echo ""
        done

}
#starf
