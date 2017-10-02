#!/bin/bash
#PBS -d /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE
#PBS -j oe
#PBS -q courte
#PBS -o /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/log/LP6005057-DNA_H02.merge.out
#PBS -l nodes=1:ppn=1
#PBS -l walltime=48:0:0
#PBS -V
/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software/samtools merge -f /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_GRCh38.bam  /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_100_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_101_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_10_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_102_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_103_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_104_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_105_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_106_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_107_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_108_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_109_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_110_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_111_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_11_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_112_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_113_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_114_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_115_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_116_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_117_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_118_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_119_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_1_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_120_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_121_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_12_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_122_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_123_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_124_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_13_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_14_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_15_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_16_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_17_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_18_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_19_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_20_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_21_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_2_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_22_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_23_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_24_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_25_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_26_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_27_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_28_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_29_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_30_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_31_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_3_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_32_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_33_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_34_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_35_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_36_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_37_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_38_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_39_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_40_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_41_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_4_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_42_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_43_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_44_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_45_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_46_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_47_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_48_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_49_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_50_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_51_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_5_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_52_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_53_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_54_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_55_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_56_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_57_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_58_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_59_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_60_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_61_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_6_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_62_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_63_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_64_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_65_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_66_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_67_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_68_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_69_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_70_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_71_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_7_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_72_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_73_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_74_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_75_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_76_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_77_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_78_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_79_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_80_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_81_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_8_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_82_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_83_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_84_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_85_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_86_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_87_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_88_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_89_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_90_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_91_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_9_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_92_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_93_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_94_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_95_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_96_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_97_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_98_GRCh38.bam /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_split_20000000_99_GRCh38.bam
/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software/samtools sort /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_GRCh38.bam -o /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_GRCh38.sorted.bam
/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software/samtools index /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_GRCh38.sorted.bam
echo /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/QUEBEC_TWINS/BAM_FILES/LP6005057-DNA_H02.bam
wc -l /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/rawdata/fastq/LP6005057-DNA_H02_1.fq
echo /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_GRCh38.sorted.bam
/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software/samtools view -c /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/bwa/GRCh38/LP6005057-DNA_H02_GRCh38.sorted.bam
