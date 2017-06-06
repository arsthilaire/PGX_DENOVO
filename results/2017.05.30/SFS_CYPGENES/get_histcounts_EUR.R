sink("Variants_counts.txt") 

print('CYP')
data <- read.table('EUR.frq', header=TRUE, row.names=NULL)
for(i in 1:nrow(data)){ if(data[i,6] > 0.5){ data[i,6] <- 1-data[i,6] } } #folded

freq = c(0.01, 0.05, 0.25)
for(f in freq){
	MIF <- data[,6]
	MIF <- subset(MIF, MIF >0) #remove 0
	hist<- hist(MIF, plot =FALSE, breaks= c(0,f,0.5))
	#colnames
	colnames <- c()
	for(x in 1:(length(hist$breaks)-1)){
        	interval<- paste(hist$breaks[x],'-',hist$breaks[x+1], sep='')
        	colnames <- c(colnames, interval)
	}
	#print result
	print(colnames)
	print(hist$counts)
}

#freq intermediaire
MIF <- data[,6]
MIF <- subset(MIF, MIF >0) #remove 0
hist<- hist(MIF, plot =FALSE, breaks= c(0,0.05,0.025,0.5))
#colnames
colnames <- c()
for(x in 1:(length(hist$breaks)-1)){
        interval<- paste(hist$breaks[x],'-',hist$breaks[x+1], sep='')
        colnames <- c(colnames, interval)
}
#print result
print(colnames)
print(hist$counts)
print("0.05-0.25 0-0.05, 0.25-0.5")
a = c(hist$counts[2], hist$counts[3]+hist$counts[1])
print(a)
#close file
sink()
