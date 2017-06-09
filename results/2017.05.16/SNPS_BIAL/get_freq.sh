while read i; do

echo $i
echo '#!/bin/bash' > freq_${i}.pbs
echo '#PBS -l walltime=1:0:0' >> freq_${i}.pbs
echo cd ~/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.16/SNPS_BIAL >> freq_${i}.pbs
echo export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 >> freq_${i}.pbs
echo module use $MUGQIC_INSTALL_HOME/modulefiles >> freq_${i}.pbs
echo module load mugqic/vcftools/0.1.14 >> freq_${i}.pbs 
echo vcftools --gzvcf /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.16/SNPS_BIAL/gene_concat_snps_bial.vcf.gz --freq2 --keep ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/${i}_indID --out ${i} >> freq_${i}.pbs
qsub freq_${i}.pbs

done <~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list
