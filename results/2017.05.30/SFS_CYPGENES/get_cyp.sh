cd /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/results/2017.05.30/SFS_CYPGENES 
export MUGQIC_INSTALL_HOME=/cvmfs/soft.mugqic/CentOS6 
module use $MUGQIC_INSTALL_HOME/modulefiles 
module load mugqic/vcftools/0.1.14  

vcftools --gzvcf /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/CYP_chr_concat.vcf.gz --bed /RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/CYPGENES/CYPgenes_coordinates_GRCh37_58.BED --min-alleles 2 --max-alleles 2 --remove-indels --recode --recode-all -out CYP 

