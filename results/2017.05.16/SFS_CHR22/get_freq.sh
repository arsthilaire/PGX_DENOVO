while read i; do

echo $i
echo '#!/bin/bash' > frq_347_${i}.pbs
echo '#PBS -l walltime=1:0:0' >> frq_347_${i}.pbs
echo cd ~/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.16/SFS_CHR22/ >> frq_347_${i}.pbs
echo export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 >> frq_347_${i}.pbs
echo module use $MUGQIC_INSTALL_HOME/modulefiles >> frq_347_${i}.pbs
echo module load mugqic/vcftools/0.1.14 >> frq_347_${i}.pbs 
echo vcftools --vcf chr22_snps_bial.recode.vcf --positions gene_position_uniq.txt --keep ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/${i}_indID_347 --freq --out ${i}_347_info >> frq_347_${i}.pbs
qsub frq_347_${i}.pbs

done <~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list
