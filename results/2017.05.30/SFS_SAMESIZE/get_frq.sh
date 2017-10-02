while read i; do

echo $i
echo '#!/bin/bash' > frq_${i}.pbs
echo '#PBS -l walltime=0:30:0' >> frq_${i}.pbs
echo cd /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.30/SFS_SAMESIZE >> frq_${i}.pbs
echo export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 >> frq_${i}.pbs
echo module use $MUGQIC_INSTALL_HOME/modulefiles >> frq_${i}.pbs
echo module load mugqic/vcftools/0.1.14 >> frq_${i}.pbs 
echo vcftools --vcf cyp_snps.recode.vcf --keep ${i}_indID_347 --freq2 --out ${i}_347 >> frq_${i}.pbs
qsub frq_${i}.pbs

done <~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list

