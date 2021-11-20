# @title: 建立STAR索引a
# @author:yhj
# @date:2021.10.11
#

STAR --runThreadN 6 --runMode genomeGenerate --genomeDir index_dir --genomeFastaFiles genome.fasta --sjdbGTFfile genome.gtf --sjdbOverhang 149
