library(plyr)
#population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)

#EUR
EUR<- read.table(file='EUR_count', header=FALSE)
EUR<- count(EUR)
EUR<- EUR[,2]
EUR<- EUR[-1]
data<- matrix(nrow=1)
data<- rbind(EUR)
names<-(1:length(EUR))

for(i in 1:length(EUR)){
        names[i]<- names[i]/1006
}
colnames(data)<- names
EUR <- data


#AFR
AFR<- read.table(file='AFR_count', header=FALSE)
AFR<- count(AFR)
AFR<- AFR[,2]
AFR<-AFR[-1]
data<- matrix(nrow=1)
data<- rbind(AFR)
names<-(1:length(AFR))
   
for(i in 1:length(AFR)){
        names[i]<- names[i]/1322
}
colnames(data)<- names
AFR <- data

#AMR
AMR<- read.table(file='AMR_count', header=FALSE)
AMR<- count(AMR)
AMR<- AMR[,2]
AMR<-AMR[-1]
data<- matrix(nrow=1)
data<- rbind(AMR)
names<-(1:length(AMR))

for(i in 1:length(AMR)){
        names[i]<- names[i]/694
}
colnames(data)<- names
AMR <- data

#EAS
EAS<- read.table(file='EAS_count', header=FALSE)
EAS<- count(EAS)
EAS<- EAS[,2]
EAS<-EAS[-1]
data<- matrix(nrow=1)
data<- rbind(EAS)
names<-(1:length(EAS))
   
for(i in 1:length(EAS)){
        names[i]<- names[i]/1008
}
colnames(data)<- names
EAS <- data

#SAS
SAS<- read.table(file='SAS_count', header=FALSE)
SAS<- count(SAS)
SAS<- SAS[,2]
SAS<-SAS[-1]
data<- matrix(nrow=1)
data<- rbind(SAS)
names<-(1:length(SAS))
   
for(i in 1:length(SAS)){
        names[i]<- names[i]/978
}
colnames(data)<- names
SAS <- data

#Plot
jpeg('sfs_log_freq_1.jpg')

plot(colnames(AFR),AFR[1,], type='l', col= "black", ylab="Count", xlab= "Frequency class", main= "Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes", log="xy")
lines(colnames(EUR),EUR[1,], type='l', col= "red")
lines(colnames(EAS),EAS[1,], type='l', col= "green")
lines(colnames(SAS),SAS[1,], type='l', col= "cyan")
lines(colnames(AMR),AMR[1,], type='l', col= "orange")
legend(0.2, 17000, legend= c('AFR','EUR','EAS','SAS','AMR'), col=c('black','red','green','cyan','orange'), lty=1)
dev.off()

