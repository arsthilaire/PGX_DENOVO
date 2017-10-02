#CHR22
#reading data
data_chr22 = read.table("CHR22/EUR_347_1000.Tajima.D", header= TRUE, col.names=c("CHROM","BIN_START","N_SNPS","TajimaD"))
data_chr22 = subset(data_chr22, data_chr22$TajimaD != "NaN")

#calulating stat
low_chr22 = quantile(data_chr22$TajimaD,c(0.025))
high_chr22 = quantile(data_chr22$TajimaD,c(0.975))

CHR22_matrix = matrix(c(low_chr22,high_chr22), nrow=1,ncol=2,byrow=FALSE)
colnames(CHR22_matrix) = c("2.5%","97.5%")
rownames(CHR22_matrix) = c("CHR22")
#print(CHR22_matrix)

#PSEUDOGENES
#reading data
pseudogenes = read.table("/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/PSEUDOGENES/PSEUDOgenes_coordinates_GRCh37_52.BED",header=FALSE, sep='\t',col.names=c("chr","start","end","name"))
#creating output file
filename=paste("tajimasd_stat_pseudogenes_EUR1000",".txt",sep="")
output=file(filename,"w")

for( i in 1:length(pseudogenes$name)){
	
	#reading data and filtering position
	data = read.table("PSEUDOGENES/EUR_347_1000.Tajima.D", header= TRUE, col.names=c("CHROM","BIN_START","N_SNPS","TajimaD"))	
	data = subset(data, data$TajimaD != "NaN")
	data = subset(data, paste("chr",data$CHROM,sep="") == pseudogenes$chr[i] )
	data = subset(data, data$BIN_START >= pseudogenes$start[i]-1000 )
	data = subset(data, data$BIN_START <= pseudogenes$end[i]+1000 )
	#filtering tajima's D values 
	low <- subset(data, data$TajimaD <= low_chr22 )
	high <- subset(data, data$TajimaD >= high_chr22) 
	#length(pseudogenes$names[i])=15
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


	rownames(test)[i] <- as.character(pseudogenes$name[i])

	#calculating stat
	Stat_output= paste(pseudogenes$name[i], min(data$TajimaD),mean(data$TajimaD),max(data$TajimaD),length(low$TajimaD),length(high$TajimaD), length(data$TajimaD), sep="\t")


}
colnames(test)=c("Min","Mean","Max","2.5%","97.5%","# 5%","# total","% in 5%")
test=test[order(test[,2], decreasing=FALSE),]
print(test)

toprint= cbind(test,as.character(pseudogenes$name))

#writing in file/ output
write.table(CHR22_matrix, output, row.names = TRUE, col.names = TRUE, quote=FALSE,sep="   ")
write.table(toprint, output, row.names = FALSE, col.names = TRUE, quote=FALSE,sep="\t")

#polting results
pdf("Tajimasd_pseudogenes_EUR.pdf")
x=1:52
plot(x,test[,2],ylim=range(-3:4), xlab= "Pseudogenes", ylab= "D de Tajima", xaxt="n", pch=16 ,cex.lab=0.7, main="Valeur D de Tajima pour chaque pseudogène du Cytochrome P450\npopulation EUR")
arrows(x,test[,1],x,test[,3], code=3, length=0.02, angle = 90)
#abline(h=0)
mean_Taj= subset(test[,2], test[,2]!= "NaN")
abline(h=mean(mean_Taj), col='red')
axis(1, at=1:52, labels=rownames(test),cex.axis =0.5, las =2)
dev.off()

#bin outside chr22 bonds
test=test[order(test[,8], decreasing=FALSE),]
test= test[,6:8]
test= cbind(as.character(pseudogenes$name),test)
write.table(test,"EUR_TajimasD_pseudogenes_bin.txt", row.names = FALSE, col.names = TRUE, quote=FALSE,sep="\t")






