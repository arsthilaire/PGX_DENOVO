while read i; do

echo $i
echo '#!/bin/bash' > frq_347_info_${i}.pbs
echo '#PBS -l walltime=0:5:0' >> frq_347_info_${i}.pbs
echo cd /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.30/SFS_PSEUDOGENES >> frq_347_info_${i}.pbs
echo export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 >> frq_347_info_${i}.pbs
echo module use $MUGQIC_INSTALL_HOME/modulefiles >> frq_347_info_${i}.pbs
echo module load mugqic/vcftools/0.1.14 >> frq_347_info_${i}.pbs 
echo vcftools --vcf PSEUDO_snps.recode.vcf --keep /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/${i}_indID_347  --freq --out ${i}_347_info >> frq_347_info_${i}.pbs
qsub frq_347_info_${i}.pbs

done <~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list

