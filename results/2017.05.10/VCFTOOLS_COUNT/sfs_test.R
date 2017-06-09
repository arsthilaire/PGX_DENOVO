library(plyr)
population <- read.table(file='/RQusagers/arsth/hussinju_group/lab_projects/PGX_DENOVO/DATA/1000G/superpop.list', header= FALSE)
for(i in population){

jpeg('sfs_test.jpg')
color= c('black','red','green','cyan','orange')

	for(p in 1:1){
		file <- paste(i[p],'_count',sep="")
		data <- read.table(file, header=FALSE)
		data <- count(data)
		data <- rbind(data[,2])		
		names <- c(1:length(data))		
		colnames(data) <- names

		if(p == 1){
			plot(colnames(data[2:length(data)]),data[2:length(data)], type='l', col= color[p], ylab="Count", xlab= "Frequency class", main= "Site Frequency Spectrum for each superpopulation\nof the 1000G data for the selected CYPgenes", log="xy")

		}	
		else if(p>1){
			lines(colnames(data[2:length(data)]),data[2:length(data)], type='l', col= color[p])

		}

	}
legend(275, 17000, legend= c('AFR','EUR','EAS','SAS','AMR'), col=c('black','red','green','cyan','orange'), lty=1)
dev.off()



}

