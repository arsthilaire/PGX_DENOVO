filename=paste("tajimasd_chr22_EUR1000",".txt",sep="")
output=file(filename,"w")

#reading data
data = read.table("CHR22/EUR_347_1000.Tajima.D", header= TRUE, col.names=c("CHROM","BIN_START","N_SNPS","TajimaD"))
data = subset(data, data$TajimaD != "NaN") 

#calulating stat
Stat_output= paste(quantile(data$TajimaD,c(0.025)) ,quantile(data$TajimaD,c(0.975)) , sep="\t")
low= subset(data, data$TajimaD < quantile(data$TajimaD,c(0.025)))
high= subset(data, data$TajimaD > quantile(data$TajimaD,c(0.975)))
n_bin = nrow(low)+nrow(high)
n_bin_tot= nrow(data)

#writing stat in file
write("2.5%\t97.5%", output,append=TRUE)
write(Stat_output, output,append=TRUE)
write("# bin in 5%\t# bin total", output,append=TRUE)
bin_stat= paste(n_bin,n_bin_tot, sep="\t")
write(bin_stat,output,append=TRUE)


