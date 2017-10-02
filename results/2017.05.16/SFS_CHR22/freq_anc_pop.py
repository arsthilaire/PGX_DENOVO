#make sure that maf is really the ancestral allele, otherwise swap. Then, output in file.
with open("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list") as f1:
	swap= 0
	i=0
	for population in f1: #for each population
		output = population.rstrip() +'_anc.frq'
		with open(output,"w") as result:
			with open("ancestral_alleles.txt") as f_annot:	
				for line_annot in f_annot:
					annot= line_annot.split(' ')
					i = i+1
					print i
					#fichier frequences
					file = population.rstrip() +'_347_info.frq'
					with open(file) as f_data:
						for line_data in f_data:
							data= line_data.split('\t')
							if annot[0] == data[0] and annot[1] == data[1]:
								if annot[3] == data[4][0:1]:
									data[5]= data[5][2:] #remove Info about allele
									data[4]= data[4][2:]
									result.write(data[0]+'\t'+data[1]+'\t'+data[2]+'\t'+data[3]+'\t'+data[4]+'\t'+data[5])
									break
								#change values
								elif annot[3] == data[5][0:1]:
									temp = data[5][2:]
									data[5]= data[4][2:]
                                	                                data[4]= temp.rstrip()	
									swap = swap + 1
									result.write(data[0]+'\t'+data[1]+'\t'+data[2]+'\t'+data[3]+'\t'+data[4]+'\t'+data[5]+'\n')
									break

		print swap

