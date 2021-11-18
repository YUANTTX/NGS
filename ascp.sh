# 下载SRA、fastq数据
# author:yhj
# date:2021.10.11
# 使用 aspare载软件
#

# 需要在ENA准备好下载文件的地址
# sh ascp.sh file_..._tsv.txt
if [ $# != 1 ] ;
then
        echo "lack of the SRA url txt file !";
        exit -1;
else
        s=1
        while [ $s != 0 ]
        do
                cat $1 | sed 's///g' | awk '{print $2}' | xargs -P 4  -i ascp -v  -l 100m -P 33001 -k 1 \
                        -i /home/yuan/software/aspera/connect/etc/asperaweb_id_dsa.openssh "era-fasp@"{} \
                        ./input/sra/
        s=$?
        done
fi
