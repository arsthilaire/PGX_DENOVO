while read i; do

echo $i
echo '#!/bin/bash' > frq_${i}.pbs
echo '#PBS -l walltime=3:0:0' >> frq_${i}.pbs
echo cd /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.30/SFS_CYPGENES >> frq_${i}.pbs
echo export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 >> frq_${i}.pbs
echo module use $MUGQIC_INSTALL_HOME/modulefiles >> frq_${i}.pbs
echo module load mugqic/vcftools/0.1.14 >> frq_${i}.pbs 
echo vcftools --gzvcf /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/CYP_chr_concat.vcf.gz --bed /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/CYPGENES/CYPgenes_coordinates_GRCh37_58.BED --keep /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/${i}_indID --min-alleles 2 --max-alleles 2 --remove-indels --freq2 --out ${i} >> frq_${i}.pbs
qsub frq_${i}.pbs

done <~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list

