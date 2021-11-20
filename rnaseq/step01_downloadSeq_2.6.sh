#! /bin/bash
#############download data  #####################
########## prepare SRR url.txt################
###################################################
#cd ~/data/ribosome_profiling
#判断是否有参数
if [ $# != 1 ] ;then
    echo "lack of the SRA url txt file !";
exit -1;
fi
#sudo iptables -I INPUT -p tcp --dport 33001 -j ACCEPT
#sudo iptables -I OUTPUT -p tcp --dport 33001 -j ACCEPT
date
a=$(date +%H%M%S)
echo "star ............"
#cat filereport_read_run_PRJNA523167_tsv-4.txt | awk '{print $2}'| sed 's/;/\n/g' | awk '{print "era-fasp@"$1}' > url.txt
mkdir -p SRA_data
cat $1 | awk '{print $2}' | awk '{print "era-fasp@"$1}' > url4.txt
head -5 url4.txt

cat url4.txt  | while read line
do
   s=1
   date
   echo "star to dowload" $line
   while [ $s != 0 ]
   do
    /home/twer820/.aspera/connect/bin/ascp -QT -l 50m -P33001 -k1 -i  /home/twer820/.aspera/connect/etc/asperaweb_id_dsa.openssh $line ./SRA_data
   s=$?
   sleep 303s
   done
   date
   echo "end to dowload" $line
done
echo "执行结束"
b=$(date +%H%M%S)
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"


# nohup sh step01_downloadSeq_2.6.sh  filereport_read_run_PRJNA229998_tsv-4.txt  &
