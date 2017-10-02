#with open("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list") as pop_file:
count =1
print count
#	for pop in pop_file:
#output= "ancestral_alleles_"+"EAS"+".txt"
#input= "EAS"+"_347_info_no_0.pos"
output= "ancestral_alleles.txt"
input= "snps_chr_pos_pseudo.txt"

with open(input) as f1:
	set = set(f1)
with open("/RQusagers/arsth/hussinju_group/DATA/1000GP_Phase3_annot/1000G_phase3_inclAnno.tsv") as f2:
	with open(output,"w") as result:
		next(f2)
		anc =' '
		for line in f2:
			col= line.split('\t')
			test = col[0]+' '+col[1]+'\n'
			temp= col[0]+' '+col[1]+' '+col[2]+' '+col[3]+' '+col[4] #to remove duplicates
			if test in set:
				if temp != anc: #if not a duplicate, continue
					count += 1
					print count
					anc= col[0]+' '+col[1]+' '+col[2]+' '+col[3]+' '+col[4]
					result.write(anc+'\n')
