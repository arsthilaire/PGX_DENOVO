ind <- read.table("ind_depth_40.list")
genes= read.table("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/PSEUDOGENES/PSEUDOgenes_coordinates_GRCh38_52.BED",col.names=c('chr','start','end','name') ,sep="\t")
output=file("pseudogenes_oxford_rmdup_40.depth","w")
output2=file("pseudogenes_oxford_rmdup_40_stat.depth","w")

ind_list=c()
gene_list=c()
for(i in 1:40){
print(i)

	#read depth file
	data = read.table(as.character(ind[i,1]),col.names=c('chr','pos','depth'), sep="\t")
	vec=c()
	
	#for each genes
	for(g in 1:52){

        	IND_name= gsub(".rmdup.depth","",as.character(ind[i,1]))	
		cov= subset(data, data$chr == genes$chr[g])
		cov= subset(cov, cov$pos >= genes$start[g])
		cov= subset(cov, cov$pos <= genes$end[g])
		mean= mean(cov$depth)
		vec= c(vec, mean)
		
		if(i==1){gene_list= c(gene_list,as.character(genes$name[g]))}
		

	}
	if(i==1){result= matrix(vec,ncol=52,nrow=1)}

	else{result= rbind(result,vec)}
	ind_list= c(ind_list, IND_name)
	

}

rownames(result)=ind_list
colnames(result)=gene_list

to_output= round(result,8)
to_output= cbind(ind_list, to_output)
print(to_output)
write.table(paste(gene_list,collapse="\t"), output, row.names=FALSE,col.names=FALSE,quote=FALSE,sep="\t")
write.table(to_output, output, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")

#calculating mean for each genes
for(g in 1:52){

	mean= round(mean(result[,g]),4)
	mean_cov=matrix(c(as.character(genes$name[g]),mean), ncol=2,nrow=1)
	if(g==1){stat_matrix= matrix(c(mean,(as.character(genes$name[g]))),nrow=1,ncol=2)}
	else{stat_matrix= rbind(stat_matrix,mean_cov)}

}

#output stat in order
stat_matrix=stat_matrix[order(stat_matrix[,1],decreasing=FALSE),]
write.table(stat_matrix, output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t",append=FALSE)


