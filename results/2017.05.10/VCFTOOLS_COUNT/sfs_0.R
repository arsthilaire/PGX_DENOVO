library(plyr)
#population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)

#AFR
AFR<- read.table(file='AFR_count', header=FALSE)
AFR<- count(AFR)
AFR<- AFR[,2]

#EUR
EUR<- read.table(file='EUR_count', header=FALSE)
EUR<- count(EUR)
EUR<- EUR[,2]
length(EUR)<- length(AFR)

#AMR
AMR<- read.table(file='AMR_count', header=FALSE)
AMR<- count(AMR)
AMR<- AMR[,2]
length(AMR)<- length(AFR)

#EAS
EAS<- read.table(file='EAS_count', header=FALSE)
EAS<- count(EAS)
EAS<- EAS[,2]
length(EAS)<- length(AFR)

#SAS
SAS<- read.table(file='SAS_count', header=FALSE)
SAS<- count(SAS)
SAS<- SAS[,2]
length(SAS)<- length(AFR)

#matrix
data<- matrix(nrow=1)
data<- rbind(AFR,EUR,EAS,SAS,AMR)
names<- c(0:(length(AFR)-1))
colnames(data)<- names

#Plot
jpeg('sfs_0_test.jpg')
barplot(data, beside=TRUE, col=c("darkblue","red","green","cyan","orange"), xlim= c(0,150), legend = rownames(data), ylab="Count", xlab= "Frequency class", main= "Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes")
dev.off()


