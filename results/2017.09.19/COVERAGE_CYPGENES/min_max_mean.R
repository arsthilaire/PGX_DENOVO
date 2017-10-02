data= read.table('genes_oxford_rmdup_40_stat.depth',col.names=c('Gene','min','Mean_coverage','max'),sep='\t')

min= min(as.character(data[,3]))
max= max(as.character(data[,3]))
mean= mean(as.character(data[,3]))
print(min)
print(max)
print(mean)
r= paste(min,mean,max, sep='    ')
print('min     mean     max')
print(r)



low= subset(data, data[,2] <= quantile(data[,2],0.025))
print(quantile(data[,2],0.025))
print(low)
high= subset(data, data[,2] >= quantile(data[,2],0.975))
print(quantile(data[,2],0.975))
print(high)



