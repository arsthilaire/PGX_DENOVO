ind <- read.table("ind_depth_40.list")
genes= read.table("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/CYPGENES/CYPgenes_coordinates_GRCh38_58.BED",col.names=c('chr','start','end','name') ,sep="\t")
output=file("genes_oxford_rmdup_40.depth","w")
output2=file("genes_oxford_rmdup_40_stat.depth","w")

ind_list=c()
gene_list=c()
for(i in 1:40){
print(i)

	#read depth file
	data = read.table(as.character(ind[i,1]),col.names=c('chr','pos','depth'), sep="\t")
	vec=c()
	
	#for each genes
	for(g in 1:58){
        	IND_name= gsub(".rmdup.depth","",as.character(ind[i,1]))	
		cov= subset(data, data$chr == genes$chr[g])
		cov= subset(cov, cov$pos >= genes$start[g])
		cov= subset(cov, cov$pos <= genes$end[g])
		mean= mean(cov$depth)
		vec= c(vec, mean)
		
		if(i==1){gene_list= c(gene_list,as.character(genes$name[g]))}
		

	}
	if(i==1){result= matrix(vec,ncol=58,nrow=1)}

	else{result= rbind(result,vec)}
	ind_list= c(ind_list, IND_name)
	
	#ouputting results
	#to_add= paste( ind[i,1], mean_depth, sep="\t")
	#write(to_add, output, append=TRUE)

}
print(gene_list)

rownames(result)=ind_list
colnames(result)=gene_list
print(result)

#gene_list= paste('\t\t\t\t',gene_list,sep='')
write.table(paste(gene_list,collapse="\t"), output, row.names=FALSE,col.names=FALSE,quote=FALSE,sep="\t")
write.table(result, output, row.names = TRUE, col.names = FALSE, quote=FALSE,sep="\t")

mean_cov = c()
write.table('name\tmin\tmean\tmax', output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
for(g in 1:58){

	mean= mean(result[,g])
	min= min(result[,g])
	max= max(result[,g])

	mean_cov=paste(as.character(genes$name[g]),min, mean,max, sep='\t')
	write.table(mean_cov, output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
	

}

