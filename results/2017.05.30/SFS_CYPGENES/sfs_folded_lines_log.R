population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)
pdf('sfs_folded_log_lin2.pdf')
color= c('black','red','green','cyan','orange')

for(p in 1:5){

	file <- paste(population[p,1],'.frq',sep="")
	data <- read.table(file, header=TRUE, row.names=NULL)
	
	for(i in 1:nrow(data)){ if(data[i,6] > 0.5){ data[i,6] <- 1-data[i,6] } } #folded

	MIF <- data[,6]
	MIF <- subset(MIF, MIF >0) #remove 0
	#hist<- hist(MIF, plot =FALSE, breaks= c(0,0.01,0.025,0.05,0.1,0.25,0.3,0.4,0.5))
	hist<- hist(MIF, plot =FALSE, breaks= c(10^-3.25,10^-3,10^-2.75,10^-2.5,10^-2.25,10^-2,10^-1.75,10^-1.5,10^-1.25,10^-1,10^-0.75,10^-0.5,10^-0.25))	
	Total= sum(hist$counts)
	if(p==1){ plot(hist$counts/Total, type='l',cex=0.7, col= color[p],log='xy', ylab="Frequency", xlab= "Frequency class", main= "Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes" ) }
		
	else if(p>1){lines( hist$counts/Total, type='l', cex=0.7, col= color[p],xaxt="n")}
print(population[p,1])
print(hist$counts)
print(hist$counts/Total)


}

#generate colnames with breaks from hist()
colnames <- c()
for(x in 1:(length(hist$breaks)-1)){
	interval<- paste(hist$breaks[x],'-',hist$breaks[x+1], sep='')
	colnames <- c(colnames, interval)
}

#axis(1, at=1:length(colnames), labels=colnames,cex.axis =0.5, las =2)
#text(cex=0.7,1:length(colnames), y= -1.25, labels = colnames, xpd=TRUE, srt=45, adj=1.2)
legend( "topright", legend= c('AFR','EUR','EAS','SAS','AMR'), col=c('black','red','green','cyan','orange'), lty=1)
dev.off()

