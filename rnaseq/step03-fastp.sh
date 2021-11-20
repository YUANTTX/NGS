#!/bin/bash
### ---------------
###
### Create: Wenru Tang
### Date: 2020.8.5
### kust
###
### ---------------
date
a=$(date +%H%M%S)
echo "star to fastqc"
: << COMMENTBLOCK
    cd ~/biosoft
    wget -c http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip
    unzip fastqc_v0.11.9.zip
    chmod 755 FastQC/fastqc
    vi ~/.bashrc
    source ~/.bashrc
    wget http://opengene.org/fastp/fastp
    chmod a+x ./fastp
    fastp -i in.fq -o out.fq
    fastp -i in.R1.fq -o out.R1.fq -I in.R2.fq -O out.R2.fq
COMMENTBLOCK

cd ./rawfq
#ls *.fastq *.fastq.gz *fq *fq.gz > fq_list.txt
ls *\.fastq.gz > fq_list.txt
head -5 fq_list.txt
cat fq_list.txt | grep "_1.fastq.gz" | cut -b 1-10 > pair_end_fq.txt
cat fq_list.txt | cut -b 1-10 > total_fq.txt
sort total_fq.txt pair_end_fq.txt pair_end_fq.txt | uniq -u >sigle_end_fq.txt


cat pair_end_fq.txt| while read id
do
  echo $id
  read1=${id}_1.fastq.gz
  read2=${id}_2.fastq.gz
  out1=${id}_clean_1.fastq.gz
  out2=${id}_clean_2.fastq.gz
~/biosoft/fastp -w 16 -i ${read1} -o $out1 -I $read2 -O $out2
done

mkdir -p fastp_results
mv *clean*fastq.gz  *fastp.html *fastp.json fastp_results

echo "end of fastp"
b=$(date +%H%M%S)
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"
cd ..
