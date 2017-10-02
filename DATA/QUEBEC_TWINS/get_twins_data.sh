#script pour telecharger les donnees de l'étude sur les twins du Québec depuis leur site ftp
#usage : bash get_twins_data.sh

while read i; do

wget ${i}

done <~/hussinju_group/lab_projects/PGX_DENOVO/DATA/QUEBEC_TWINS/ftp_list.txt
