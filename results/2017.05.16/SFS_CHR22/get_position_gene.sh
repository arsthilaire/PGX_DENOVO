awk -F '\t' '{if ($1 ==22 && $96 !="NA") print $1, $2, $96 ;}' /RQusagers/arsth/hussinju_group/DATA/1000GP_Phase3_annot/1000G_phase3_inclAnno.tsv
