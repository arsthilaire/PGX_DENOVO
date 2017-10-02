pdf('sfs_derived_chr22.pdf')
color= c('black','red','green','cyan','orange')
population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)
for(p in 1:5){
        file <- paste(population[p,1],'_anc.frq',sep="")
        data <- read.table(file, header=TRUE, row.names=NULL)

	MIF <- data[,6]
	MIF <- subset(MIF, MIF >0)
	hist<- hist(MIF, plot =FALSE,  breaks=c(0,0.002,0.004,0.005,0.007,0.01,0.02,0.05,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))	
	if(p==1){ result<- rbind(hist$count) }
	else if(p>1){result<- rbind(result,hist$count) }
	print(length(MIF))
}
rownames(result)= c('AFR','EUR','EAS','SAS','AMR')

#generate colnames with breaks from hist()
colnames <- c()
for(x in 1:(length(hist$breaks)-1)){
	interval<- paste(hist$breaks[x],'-',hist$breaks[x+1], sep='')
	colnames <- c(colnames, interval)
}
colnames(result)<- colnames

x<-barplot(result,beside=TRUE, col= color, ylab="Compte",legend = rownames(result), xlab= "Fréquence allélique", main= "Spectre des fréquences alléliques pour chaque population du
1000 Genomes Project des gènes du chromosome 22",las = 2,  cex.names=0.6)

#text(cex=0.6, x=colMeans(x)+1.4, y=1.25, labels = paste(colnames(result)), xpd=TRUE, srt=45, adj=1.3)

dev.off()

