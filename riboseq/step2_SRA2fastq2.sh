#!/bin/bash
# sar2fastq

start_time=`date`

tmp_fifofile="/tmp/$$.fifo"
mkfifo $tmp_fifofile
exec 6<>$tmp_fifofile
rm $tmp_fifofile

thread_num=4
for ((i=0;i<${thread_num};i++));do
    echo
done >&6

for filename in `ls input/sra/`
do
    read -u6
    {
    #Start
    	echo "正在转换 $filename"
   	 srapath="./input/sra/$filename/$filename.sra"
    	/home/yuan/software/sratoolkit/bin/fastq-dump --split-3 $srapath -O ./input/fastq/
    	echo "$filename 转换完成"
    #End
        echo >&6
    } &
done
wait
stop_time=`date`
exec 6>&-
echo "Start: $start_time \n Stop:$stop_time"

