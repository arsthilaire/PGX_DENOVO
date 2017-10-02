genes = read.table("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/CYPGENES/CYPgenes_coordinates_GRCh38_58.BED",header=FALSE, sep='\t',col.names=c("chr","start","end","name"))
output2=file("genes_oxford_rmdup_40_stat.depth","w")

result= read.table("genes_oxford_rmdup_40.depth", header =TRUE, sep='\t')
write.table('name\tmin\tmean\tmax', output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
print(result[,1])
for(g in 1:58){

	mean= mean(result[,g])
	min= min(result[,g])
	max= max(result[,g])
	mean_cov=paste(as.character(genes$name[g]),min, mean,max, sep='\t')
	write.table(mean_cov, output2, row.names = FALSE, col.names = FALSE, quote=FALSE,sep="\t")
	vec= c(as.character(genes$name[g]),min, mean,max)

	if(g==1){test=matrix(vec, nrow=1,ncol=4)}
	else{test=rbind(test,vec)}



}
subset(result[,58],result[,58]<=20)

rownames(test)<- as.character(genes$name)
test=test[,2:4]
test=test[order(test[,2], decreasing=FALSE),]
print(test)
#polting results
pdf("coverage_cypgenes2.pdf")
x=1:58
min=test[,1]
max=test[,3]

plot(x,as.numeric(test[,2]),ylim=c(0,90), xlab= "Genes", ylab= "Couverture", xaxt="n", pch=16 ,cex.lab=0.7, main="Distribution de la couverture des gènes \ndu Cytochrome P450")
arrows(x,as.numeric(test[,1]),x,as.numeric(test[,3]), code=3, length=0.02, angle = 90)
axis(1, at=1:58, labels=rownames(test),cex.axis =0.5, las =2)
abline(h=mean(as.numeric(test[,2])), col="red")
dev.off()

print(mean(as.numeric(test[,2])))
