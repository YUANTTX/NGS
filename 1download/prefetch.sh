#!/bin/bash
# title:下载NCBI SRA数据
# 文件下载位置：./input/sra/ or ./input/fastq/

# 使用 sratoolkit 软件：prefetch
#prefetch --option-file ./SRR_Acc_List.txt  -O ./input/sra/

# 使用 aspare载软件
# 需要在ENA准备好下载文件的地址
if [ $# != 1 ] ;then
    echo "lack of the SRA url txt file !";
exit -1;
fi
cat $1 | awk '{print $2}' > url4.txt
head -5 url4.txt
s=1
while [ $s != 0 ]
do
    cat url4.txt | xargs -P 4  -i ascp -v  -l 100m -P 33001 -k 1 -i /biowork/biosoft/aspera/connect/etc/asperaweb_id_dsa.openssh "era-fasp@"{} ./input/sra/
    s=$?
done
rm url4.txt

