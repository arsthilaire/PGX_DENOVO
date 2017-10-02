#EAS
awk '{if($2 ~ /CHB/ && ind_chb < 69) {ind_chb++; print $1 ;} 
else if($2 ~ /JPT/ && ind_JPT < 69) {ind_JPT++; print $1 ;} 
else if($2 ~ /CHS/ && ind_chs < 69) {ind_chs++; print $1 ;}
else if($2 ~ /CDX/ && ind_CDX < 70) {ind_CDX++; print $1 ;} 
else if($2 ~ /KHV/ && ind_KHV < 70) {ind_KHV++; print $1 ;}
}' ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/1000G_ind_2504.pedigree > EAS_indID_347
wc -l EAS_indID_347

#EUR
awk '{ if($2 ~ /CEU/ && ind_CEU < 70) {ind_CEU++; print $1 ;} 
else if($2 ~ /TSI/ && ind_TSI < 69) {ind_TSI++; print $1 ;} 
else if($2 ~ /GBR/ && ind_GBR < 69) {ind_GBR++; print $1 ;}
else if($2 ~ /FIN/ && ind_FIN < 70) {ind_FIN++; print $1 ;} 
else if($2 ~ /IBS/ && ind_IBS < 69) {ind_IBS++; print $1 ;}
}' ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/1000G_ind_2504.pedigree > EUR_indID_347
wc -l EUR_indID_347

#SAS
awk '{ if($2 ~ /GIH/ && ind_GIH < 69) {ind_GIH++; print $1 ;} 
else if($2 ~ /PJL/ && ind_PJL < 69) {ind_PJL++; print $1 ;} 
else if($2 ~ /BEB/ && ind_BEB < 69) {ind_BEB++; print $1 ;}
else if($2 ~ /STU/ && ind_STU < 70) {ind_STU++; print $1 ;}
else if($2 ~ /ITU/ && ind_ITU < 70) {ind_ITU++; print $1 ;}
}' ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/1000G_ind_2504.pedigree > SAS_indID_347
wc -l SAS_indID_347

#AFR
awk '{ if($2 ~ /LWK/ && ind_LWK < 49) {ind_LWK++; print $1 ;} 
else if($2 ~ /GWD/ && ind_GWD < 49) {ind_GWD++; print $1 ;} 
else if($2 ~ /MSL/ && ind_MSL < 49) {ind_MSL++; print $1 ;}
else if($2 ~ /ESN/ && ind_ESN < 49) {ind_ESN++; print $1 ;}
else if($2 ~ /ASW/ && ind_ASW < 49) {ind_ASW++; print $1 ;}
else if($2 ~ /ACB/ && ind_ACB < 49) {ind_ACB++; print $1 ;}
else if($2 ~ /YRI/ && ind_YRI < 53) {ind_YRI++; print $1 ;}
}' ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/1000G_ind_2504.pedigree > AFR_indID_347
wc -l AFR_indID_347

#AMR
awk '$2 ~ /MXL|PUR|CLM|PEL/ {print $1 }' ~/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/1000G_ind_2504.pedigree > AMR_indID_347
wc -l AMR_indID_347


