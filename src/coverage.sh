#!/bin/bash
#PBS -d /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE
#PBS -j oe
#PBS -q courte
#PBS -l mem=8G
#PBS -l walltime=12:0:0    
#PBS -V             
#PBS -v bam=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005058-DNA_A03_GRCh38.rmdup.bam

SOFTWARE=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software


OUTPUT=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.09.19/COVERAGE_PSEUDOGENES
#${SOFTWARE}/bedtools coverage -sorted -a /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/DATA/CYPGENES/CYPgenes_coordinates_GRCh38_58.sorted.BED -b ${bam}

#dedup=${bam/".rmdup.bam"/".rmdup"}
dedup=${bam/".sorted.bam"/".sorted"}
dedup_final=${dedup/\/RQexec\/GROUP\/hussinju\/COMMUN\/hussinju_group\/lab_projects\/PGX_DENOVO\/results\/2017.07.11\/OXFORD_PIPELINE\/bwa\/GRCh38\//}

echo $dedup_final
${SOFTWARE}/samtools depth -a -b /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/DATA/PSEUDOGENES/PSEUDOgenes_coordinates_GRCh38_52.BED ${bam} > ${OUTPUT}/${dedup_final}.pseudo.depth


#if from mugqic

#dedup=${bam/".sorted.bam"/".sorted"}
#${SOFTWARE}/samtools depth -a -b /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/DATA/PSEUDOGENES/PSEUDOgenes_coordinates_GRCh38_52.BED ${bam} > ${dedup}.pseudo.depth

