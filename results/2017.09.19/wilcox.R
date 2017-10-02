
genes= read.table('COVERAGE_CYPGENES/genes_oxford_rmdup_40_stat.depth',col.names=c('Gene','min','Mean_coverage','max'),sep='\t',header=TRUE)
pseudogenes= read.table('COVERAGE_PSEUDOGENES/pseudogenes_oxford_rmdup_40_stat.depth',col.names=c('Gene','min','Mean_coverage','max'),sep='\t',header=TRUE)

wilcox.test(x= as.numeric(genes$Mean_coverage), y= as.numeric(pseudogenes$Mean_coverage), paired =FALSE)
t.test(x= as.numeric(genes$Mean_coverage), y= as.numeric(pseudogenes$Mean_coverage), paired =FALSE)
print(mean(genes$Mean_coverage))




