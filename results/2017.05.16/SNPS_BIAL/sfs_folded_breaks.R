population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)
pdf('sfs_folded_snps_june2.pdf')
color= c('black','red','green','cyan','orange')

for(p in 1:5){

	file <- paste(population[p,1],'.frq',sep="")
	data <- read.table(file, header=TRUE, row.names=NULL)
	
	for(i in 1:nrow(data)){ if(data[i,6] > 0.5){ data[i,6] <- 1-data[i,6] } } #folded

	MIF <- data[,6]
	MIF <- subset(MIF, MIF >0)
	hist<- hist(MIF, plot =FALSE, breaks=seq(0,0.5,by=0.05))	
	total = sum(hist$counts)
	if(p==1){ result<- rbind(hist$count/total) }
		
	else if(p>1){result<- rbind(result,hist$count/total) }
	

}
rownames(result)= c('AFR','EUR','EAS','SAS','AMR')

#generate colnames with breaks from hist()
colnames <- c()
for(x in 1:(length(hist$breaks)-1)){
	interval<- paste(hist$breaks[x],'-',hist$breaks[x+1], sep='')
	colnames <- c(colnames, interval)
}
colnames(result)<- colnames


x<-barplot(result,beside=TRUE, col= color, ylab="Count", xaxt = "n",legend = rownames(result), xlab= "Frequency class", main= "Folded Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes")

text(cex=0.6, x=colMeans(x)+1.4, y=-1.25, labels = paste(colnames(result)), xpd=TRUE, srt=45, adj=1.3)

dev.off()

