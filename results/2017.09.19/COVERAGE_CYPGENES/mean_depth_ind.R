ind <- read.table("ind_oxford_40.list")
output=file("mean_oxford_rmdup_40.depth","w")


for(i in 1:length(ind[,1])){
print(i)
	#read depth file
	data = read.table(as.character(ind[i,1]), sep="\t")
	
	#calculate mean of depth for all genes
	mean_depth = mean(data[,3])
	
	#IND_name= gsub(".sorted.depth",".rmdup.depth",as.character(ind[i,1]))
	
	#ouputting results
	to_add= paste( ind[i,1], mean_depth, sep="\t")
	write(to_add, output, append=TRUE)

}

data= read.table("mean_oxford_rmdup_40.depth", sep="\t")
min = min(data[,2])
max= max(data[,2])
mean = mean(data[,2])

title= "min\tmax\tmean"
to_add=paste(min,max,mean, sep='\t')
write(title, output, append=TRUE)
write(to_add, output, append=TRUE)
