#! /bin/bash
#############download data  #####################
########## prepare SRR_Acc_List.txt################
###################################################
#cd ~/data/ribosome_profiling
#sudo iptables -I INPUT -p tcp --dport 33001 -j ACCEPT
#sudo iptables -I OUTPUT -p tcp --dport 33001 -j ACCEPT
sraOutPath=`pwd`
echo $sraOutPath
#sra_ftp="anonftp@ftp-private.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/SRR/"
sra_ftp="anonftp@ftp.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/SRR/"

cat SRR_Acc_List.txt | awk '{print substr($1,1,6)"/"$1"/"$1".sra"}' > down1.txt
cat down1.txt | awk '{print v1$0,v2}' v1=$sra_ftp v2=$sraOutPath >down2.txt
cat SRR_Acc_List.txt | head -n 5
cat down1.txt | head -n 5
cat down2.txt | head -n 5
rm -rf dwon1.txt
cat down2.txt | xargs ascp -v -QT -l 40m -P33001 -k1 -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh  {}



#nohup ascp  -l 10m -P33001 -k 1 -i  ~/.aspera/connect/etc/asperaweb_id_dsa.openssh  era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR859/005/SRR8590755/SRR8590755.fastq.gz ./fq &



