while read -r gene start end chr chrnum id length; do

echo '#!/bin/bash' > scr_${gene}.pbs
echo '#PBS -l walltime=1:0:0' >> scr_${gene}.pbs
echo cd ~/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.16/SFS_CHR22/ >> scr_${gene}.pbs
echo export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 >> scr_${gene}.pbs
echo module use $MUGQIC_INSTALL_HOME/modulefiles >> scr_${gene}.pbs
echo module load mugqic/vcftools/0.1.14 >> scr_${gene}.pbs 
echo vcftools --gzvcf  ALL.chr${chrnum}.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --chr ${chrnum} --from-bp ${start} --to-bp ${end} --remove-indels --min-alleles 2 --max-alleles 2 --recode --recode-INFO-all --out ${gene} >> scr_${gene}.pbs
#qsub scr_${gene}.pbs

done <CYPgenes_coordinates_GRCh37.txt
