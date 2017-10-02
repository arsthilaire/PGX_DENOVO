#output ancestral alleles from CADD annotation
count =1
print count
output= "ancestral_alleles.txt"
input= "snps_pos_chr22.txt"

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
