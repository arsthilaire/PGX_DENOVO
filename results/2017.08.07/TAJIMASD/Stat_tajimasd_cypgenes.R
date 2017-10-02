#CHR22
#reading data
data_chr22 = read.table("CHR22/AFR_347_1000.Tajima.D", header= TRUE, col.names=c("CHROM","BIN_START","N_SNPS","TajimaD"))
data_chr22 = subset(data_chr22, data_chr22$TajimaD != "NaN")

#calulating stat
low_chr22 = quantile(data_chr22$TajimaD,c(0.025))
high_chr22 = quantile(data_chr22$TajimaD,c(0.975))

CHR22_matrix = matrix(c(low_chr22,high_chr22), nrow=1,ncol=2,byrow=FALSE)
colnames(CHR22_matrix) = c("2.5%","97.5%")
rownames(CHR22_matrix) = c("CHR22")
#print(CHR22_matrix)

#GENES
#reading data
genes = read.table("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/CYPGENES/CYPgenes_coordinates_GRCh37_58.BED",header=FALSE, sep='\t',col.names=c("chr","start","end","name"))
#creating output file
filename=paste("tajimasd_stat_cypgenes_AFR1000",".txt",sep="")
output=file(filename,"w")
#write("Gene\tMin\tMean\tMax\t2.5%\t97.5%\tbin in total", output,append=TRUE)

for( i in 1:length(genes$name)){
	
	#reading data and filtering position
	data = read.table("CYPGENES/AFR_347_1000.Tajima.D", header= TRUE, col.names=c("CHROM","BIN_START","N_SNPS","TajimaD"))	
	data = subset(data, data$TajimaD != "NaN")
	data = subset(data, paste("chr",data$CHROM,sep="") == genes$chr[i] )
	data = subset(data, data$BIN_START >= genes$start[i]-1000 )
	data = subset(data, data$BIN_START <= genes$end[i]+1000 )
	#filtering tajima's D values 
	low <- subset(data, data$TajimaD <= low_chr22 )
	high <- subset(data, data$TajimaD >= high_chr22) 
	length(genes$names[i])=15
	
	#building matrix with results
	min= round(min(data$TajimaD),4)
	max= round(max(data$TajimaD),4)
	mean= round(mean(data$TajimaD),4)
	length_low= length(low$TajimaD)
	length_high= length(high$TajimaD)
	length_highlow= length(high$TajimaD)+ length(low$TajimaD)
	length_total= length(data$TajimaD)
	freq_outside= round((length_highlow/length_total),4)


	if(i==1){ test=matrix(c(min,mean,max,length_low,length_high, length_highlow,length_total,freq_outside), nrow=1, ncol=8, byrow=FALSE)}

	else{
		to_add= matrix(c(min,mean,max,length_low,length_high, length_highlow,length_total,freq_outside), nrow=1, ncol=8, byrow=FALSE)
		test= rbind(test, to_add)}

	rownames(test)[i] <- as.character(genes$name[i])

	#calculating stat
	Stat_output= paste(genes$name[i], min(data$TajimaD),mean(data$TajimaD),max(data$TajimaD),length(low$TajimaD),length(high$TajimaD), length(data$TajimaD), sep="\t")


}
colnames(test)=c("Min","Mean","Max","2.5%","97.5%","# 5%","# total","% in 5%")
test=test[order(test[,2], decreasing=FALSE),]
print(test)

#writing in file/ output
write.table(CHR22_matrix, output, row.names = TRUE, col.names = TRUE, quote=FALSE,sep="   ")
write.table(test, output, row.names = TRUE, col.names = TRUE, quote=FALSE,sep="\t")

#ploting result
pdf("Tajimasd_cypgenes_AFR.pdf")
x=1:58
plot(x,test[,2],ylim=range(-3:4), xlab= "Genes", ylab= "D de Tajima", xaxt="n", pch=16 ,cex.lab=0.7, main="Valeur D de Tajima pour chaque gène du Cytochrome P450\npopulation AFR")
arrows(x,test[,1],x,test[,3], code=3, length=0.02, angle = 90)
mean_Taj= subset(test[,2], test[,2]!= "NaN")
abline(h=mean(mean_Taj), col='red')
axis(1, at=1:58, labels=rownames(test),cex.axis =0.5, las =2)


dev.off()

test=test[order(test[,8], decreasing=FALSE),]
test= test[,6:8]
write.table(test,"TajimasD_cypgenes_bin_AFR.txt", row.names = TRUE, col.names = TRUE, quote=FALSE,sep="\t")






