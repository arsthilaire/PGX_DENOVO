#script pour telecharger les donnees du 1000G depuis leur site ftp
#usage : bash get_1000G_data.sh

#wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/README*

for i in {1..20}; do
wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr${i}*
done

