# @title: 建立samlon索引
# @author:yhj
# @date:2021.10.11
#

# 1、使用脚本构建文库，生成 decoys.txt
bash /home/yuan/script/salmon/generateDecoyTranscriptome.sh -a /home/yuan/database/genomes/hg38/gencode.v37.annotation.gtf -g /home/yuan/database/genomes/hg38GRCh38.p13.genome.fa -t /home/yuan/database/genomes/hg38gencode.v38.transcripts.fa -o /home/yuan/database/index/samlon/hg38/
# 2、建立index：
salmon index -t /home/yuan/database/index/samlon/hg38/gentrome.fa -d /home/yuan/database/index/samlon/hg38/decoys.txt -i /home/yuan/database/index/samlon/hg38/
