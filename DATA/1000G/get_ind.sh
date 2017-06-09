awk '$7 ~ /MXL|PUR|CLM|PEL/ {print $2}' 20130606_g1k.ped > AMR_indID
awk '$7 ~ /YRI|LWK|GWD|MSL|ESN|ASW|ACB/ {print $2}' 20130606_g1k.ped > AFR_indID
awk '$7 ~ /CEU|TSI|FIN|GBR|IBS/ {print $2}' 20130606_g1k.ped > EUR_indID
awk '$7 ~ /CHB|JPT|CHS|CDX|KHV/ {print $2}' 20130606_g1k.ped > EAS_indID
awk '$7 ~ /GIH|PJL|BEB|STU|ITU/ {print $2}' 20130606_g1k.ped > SAS_indID

