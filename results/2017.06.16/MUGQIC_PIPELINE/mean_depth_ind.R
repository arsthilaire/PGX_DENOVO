ind <- read.table("ind_depth.list")
output=file("mean_depth_mugqic_3.ind","w")
len= length(ind[,1])

for(i in 1:len){
print(i)
	#read depth file
	data = read.table(as.character(ind[i,1]), sep="\t")
	
	#calculate mean of depth for all genes
	mean_depth = mean(data[,3])
	
	IND_name= gsub(".rmdup.depth","",as.character(ind[i,1]))
	
	#ouputting results
	to_add= paste( IND_name, mean_depth, sep="\t")
	write(to_add, output, append=TRUE)

}

data= read.table("mean_depth_mugqic_3.ind", sep="\t")
min = min(data[,2])
max= max(data[,2])
mean = mean(data[,2])

title= "min\tmax\tmean"
to_add=paste(min,max,mean, sep='\t')
write(title, output, append=TRUE)
write(to_add, output, append=TRUE)
