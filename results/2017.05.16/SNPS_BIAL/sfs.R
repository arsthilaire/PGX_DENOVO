library(plyr)
#population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)

#AFR
AFR<- read.table(file='AFR.frq.count', header=TRUE, row.names=NULL)
AFR<- count(AFR[,6])
AFR<- AFR[,2]

#EUR
EUR<- read.table(file='EUR.frq.count', header=TRUE, row.names=NULL)
EUR<- count(EUR[,6])
EUR<- EUR[,2]
length(EUR)<- length(AFR)

#AMR
AMR<- read.table(file='AMR.frq.count', header=TRUE, row.names=NULL)
AMR<- count(AMR[,6])
AMR<- AMR[,2]
length(AMR)<- length(AFR)

#EAS
EAS<- read.table(file='EAS.frq.count', header=TRUE, row.names=NULL)
EAS<- count(EAS[,6])
EAS<- EAS[,2]
length(EAS)<- length(AFR)

#SAS
SAS<- read.table(file='SAS.frq.count', header=TRUE, row.names=NULL)
SAS<- count(SAS[,6])
SAS<- SAS[,2]
length(SAS)<- length(AFR)

#matrix
data<- matrix(nrow=1)
data<- rbind(AFR,EUR,EAS,SAS,AMR)
names<- c(0:(length(AFR)-1))
colnames(data)<- names

#Plot
jpeg('sfs.jpg')
barplot(data[,2:length(AFR)], beside=TRUE, col=c("darkblue","red","green","cyan","orange"), legend = rownames(data), ylab="Count", xlab= "Frequency class", main= "Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes")

#zoom
#barplot(data[,2:length(AFR)], beside=TRUE, col=c("darkblue","red","green","cyan","orange"), xlim= c(0,150), legend = rownames(data), ylab="Count", xlab= "Frequency class", main= "Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes")
dev.off()


