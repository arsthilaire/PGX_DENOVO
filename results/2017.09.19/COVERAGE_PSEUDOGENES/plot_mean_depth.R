pseudogenes = read.table("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/PSEUDOGENES/PSEUDOgenes_coordinates_GRCh38_52.BED",header=FALSE, sep='\t',col.names=c("chr","start","end","name"))
output2=file("pseudogenes_oxford_rmdup_40_stat.depth","w")

result= read.table("pseudogenes_oxford_rmdup_40.depth", header =TRUE, sep='\t')
write.table('name\tmin\tmean\tmax', output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")

for(g in 1:52){
	if(g==16){print(result[,g])}
	mean= mean(result[,g])
	min= min(result[,g])
	max= max(result[,g])
	mean_cov=paste(as.character(pseudogenes$name[g]),min, mean,max, sep='\t')
	write.table(mean_cov, output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
	vec= c(min, mean,max)

	if(g==1){test=matrix(vec, nrow=1,ncol=3)}
	else{test=rbind(test,vec)}



}

rownames(test)<- as.character(pseudogenes$name)
#write.table(quantile(test[,2],0.025), output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
#write.table(quantile(test[,2],0.975), output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
#for(i in 1:length(test[,2])){
#	if (test[i,2] >= quantile(test[,2],0.975) || test[i,2] <= quantile(test[,2],0.025)){ 
#		write.table(test[i,], output2, row.names = TRUE, col.names = FALSE, quote=FALSE,sep="\t")
#	}
#

#}




test=test[order(test[,2], decreasing=FALSE),]
print(test)
#polting results
pdf("coverage_pseudogenes.pdf")
x=1:52
min=as.numeric(test[,1])
max=as.numeric(test[,3])

plot(x,test[,2],ylim=c(0,90), xlab= "Pseudogenes", ylab= "Couverture", xaxt="n", pch=16 ,cex.lab=0.7, main="Distribution de la couverture des pseudogènes du Cytochrome P450")
arrows(x,min,x,max, code=3, length=0.02, angle = 90)
axis(1, at=1:52, labels=rownames(test),cex.axis =0.5, las =2)
abline(h=mean(as.numeric(test[,2])), col="red")
dev.off()

print(mean(as.numeric(test[,2])))
