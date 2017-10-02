#!/bin/bash
#PBS -d /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE
#PBS -j oe
#PBS -q courte
#PBS -l nodes=1:ppn=2
#PBS -l walltime=24:0:0    
#PBS -l mem=4G
#PBS -V             
#PBS -v bam=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005058-DNA_B01_GRCh38.sorted.bam

dedup=${bam/".sorted.bam"/".rmdup.bam"}
SOFTWARE=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software/

/home/apps/Logiciels/Java/jdk1.8.0_40/bin/java -Xmx3g -jar ${SOFTWARE}/picard MarkDuplicates MAX_FILE_HANDLES=1024 REMOVE_DUPLICATES=true I=${bam} O=${dedup} M=${dedup/".bam"/".metrics"} VALIDATION_STRINGENCY=SILENT TMP_DIR=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/tmp/

${SOFTWARE}/samtools index ${dedup}
