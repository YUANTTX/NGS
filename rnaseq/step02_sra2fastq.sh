#!/bin/bash

### ---------------
###
### Create: Wenru Tang
### Date: 2021-9-27

### ---------------


date
a=$(date +%H%M%S)
echo "star ............"
mkdir -p rawfq
ls ./SRA_data | while read id
do
  fastq-dump --gzip --split-3  $id  -O ./rawfq
done
date
b=$(date +%H%M%S)
echo "end ............"
# nohup sh step02_sra2fastq.sh &
