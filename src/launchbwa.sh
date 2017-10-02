#!/bin/bash
#PBS -A trf-262-ab
#PBS -V
#PBS -d /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE 
#PBS -j oe 
#PBS -q normale 
#PBS -l nodes=1:ppn=12
#PBS -l walltime=168:00:00
#PBS -l mem=21G
#PBS -v fqfile="/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/DATA/QUEBEC_TWINS/LP6005057-DNA_B02",pathout="/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE"

#usage qsub -v fqfile=$fqfile -v pathout=$path -v assembly=$assembly -v refgenome=$refgenome -v SOFTWARE=software launchbwal.sh
assembly="GRCh38"
refgenome="/cvmfs/soft.mugqic/CentOS6/genomes/species/Homo_sapiens.GRCh38/genome/bwa_index/Homo_sapiens.GRCh38.fa"
SOFTWARE="/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software"


c=9

if [ ! -f $pathout/$(basename ${fqfile}_1_${assembly}.sai) ]; then
    echo "bwa aln left"
    ${SOFTWARE}/bwa aln -t $c $refgenome ${fqfile}_1.fq > $pathout/$(basename ${fqfile}_1_${assembly}.sai) #${fqfile}_1_${assembly}.sai
fi

if [ ! -f $pathout/$(basename ${fqfile}_2_${assembly}.sai) ]; then
    echo "bwa aln right"
    ${SOFTWARE}/bwa aln -t $c $refgenome ${fqfile}_2.fq > $pathout/$(basename ${fqfile}_2_${assembly}.sai) #${fqfile}_2_${assembly}.sai 
fi

if [ ! -s $pathout/$(basename ${fqfile}_${assembly}.sam) ] || [ ! -s $pathout/$(basename ${fqfile}_${assembly}.bam) ]; then
    echo "bwa sampe"
    ${SOFTWARE}/bwa sampe $refgenome $pathout/$(basename ${fqfile}_1_${assembly}.sai) $pathout/$(basename ${fqfile}_2_${assembly}.sai) ${fqfile}_1.fq ${fqfile}_2.fq > $pathout/$(basename ${fqfile}_${assembly}.sam) #${fqfile}_${assembly}.sam
fi

#if false; then

#conversion to bam 
if [ ! -f $pathout/$(basename ${fqfile}_${assembly}.bam) ]; then
    echo "conversion"
    #/apps/well/samtools/0.1.19/bin/samtools view -Sb ${fqfile}_${assembly}.sam > ${fqfile}_${assembly}.bam
    ${SOFTWARE}/samtools view -Sb $pathout/$(basename ${fqfile}_${assembly}.sam) > $pathout/$(basename ${fqfile}_${assembly}.bam)
fi

if [ -f $pathout/$(basename ${fqfile}_${assembly}.bam) ]; then
    rm $pathout/$(basename ${fqfile}_${assembly}.sam)
fi

#mv files out of fastq directory
#mv -n ${fqfile}_${assembly}.bam $pathout/
#mv -n ${fqfile}_*_${assembly}.sai $pathout/

echo "read count in file $pathout/$(basename ${fqfile}_${assembly}.bam)"
${SOFTWARE}/samtools view -c $pathout/$(basename ${fqfile}_${assembly}.bam)

#fi

echo done
