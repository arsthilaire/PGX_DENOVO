#!/bin/bash
#PBS -A trf-262-ab
#PBS -q courte
#PBS -l nodes=1:m48G:ppn=12
#PBS -l mem=40G
#PBS -V
#PBS -d /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE 
#PBS -j oe
#PBS -o /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/log 
#PBS -v PIPELINE=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE,assembly=GRCh38,SOFTWARE=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software,pathsource=/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/src,boolsplit=true,boolwrite=true,boolclean=true
#PBS -l walltime=48:00:00


#usage : qsub -v bam=bamfile bamtobwasplit.sh 
#this usage is for high memory nodes (for samtools sort). Change to #PBS -l nodes=1:ppn=1 -l mem=$lower_value -v mem=$even_lower_value


#source ${pathsource}/set_variables.sh


#adjust to change the number of reads in each fastq split (smaller=more mapping jobs=faster)
#must be a multiple of 4 due to fastq formatting

JAVA_PATH="/home/apps/Logiciels/Java/jdk1.8.0_40/bin"
PIPELINE="/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE"
assembly="GRCh38"
SOFTWARE="/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/software"
pathsource="/RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/src"
fq="fq"

length=20000000
outputpath=${PIPELINE}/bwa
scriptpath=${PIPELINE}/scripts
refgenome=${PIPELINE}/refs/${assembly}
#create directories if they don't exist
fastqpath=${PIPELINE}/rawdata/fastq
mkdir -p $fastqpath
mkdir -p $outputpath/$assembly
mkdir -p $scriptpath

#bam=${PIPELINE}/rawdata/${name}_rawmerge.bam 

bamname=$(basename $bam)
name=${bamname/".bam"/""}
splitname=${fastqpath}/${name}_split_${length}

#conversion to fastq and split

if $boolsplit; then
    #don't redo the conversion and splits if already complete
    if [ ! -f ${splitname}_1_1.${fq} ]; then
        #sort by read name for conversion to fastq if doesnt exist
         if [ ! -f ${fastqpath}/${name}_1.${fq} ]; then
            if [ ! -f ${bam/".bam"/".namesorted.bam"} ]; then
                echo "Sorting BAM file ${bam} for FASTQ conversion"
                ${SOFTWARE}/samtools sort -m 24G -n ${bam} -o ${bam/".bam"/".namesorted.bam"}
            fi

            #bamToFastq
            echo "Converting ${bam} to fastq"
            ${SOFTWARE}/bamToFastq -i ${bam/".bam"/".namesorted.bam"} -fq ${fastqpath}/${name}_1.${fq} -fq2 ${fastqpath}/${name}_2.${fq}
            echo bamToFastq done
        fi
        if [ -s ${fastqpath}/${name}_1.${fq} ]; then
        #    rm ${bam/".bam"/".namesorted.bam"}
        #fi

        #splits in 10M reads per file
        echo "Splitting FASTQ into chunks of ${length}"
        split -a 3 -l ${length} -d ${fastqpath}/${name}_1.${fq} ${splitname}_1-
        split -a 3 -l ${length} -d ${fastqpath}/${name}_2.${fq} ${splitname}_2-

        #add the fq extension
        i=1
        for file in ${splitname}_1-*
            do
                mv $file ${splitname}_${i}_1.${fq}
                i=$(( i + 1 ))
            done

        i=1
        for file in ${splitname}_2-*
            do
                mv $file ${splitname}_${i}_2.${fq}
                i=$(( i + 1 ))
            done

        nbsplit=$((i-1))
        echo "bamfile splitted in $nbsplit files"
	fi
    fi
    
fi

#writes script to launch bwa on cluster for this genome assembly on each file
bwapath=${scriptpath}/${name}_${assembly}.bwa.sh
if [ -s ${bwapath} ]; then
    rm ${bwapath}
fi

if [ ! -s $outputpath/${assembly}/ ]; then
    mkdir $outputpath/${assembly}
fi

for file in ${splitname}_*_1.${fq}
    do
        echo $file
	#JH 2017/07/28: warning refgenome, SOFTWARE and assembly variable are hardcoded in launchbwa.sh!
        echo qsub -o /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/log/bwa_$(basename ${file/"_1.${fq}"/""}).out -l walltime=48:00:00 -q courte -N bwa_$(basename ${file/"_1.${fq}"/""}) -v fqfile=${file/"_1.${fq}"/""},pathout=$outputpath/${assembly},assembly=${assembly},refgenome=${refgenome}.fasta,SOFTWARE=${SOFTWARE} ${pathsource}/launchbwa.sh >> ${bwapath}

        outfile=${file/"_1.${fq}"/"_${assembly}.bam"}
        alloutnames=$alloutnames" $outputpath/${assembly}/$(basename $outfile)"

done

echo "bwa script written in ${bwapath}"

mergepath=${scriptpath}/${name}_${assembly}.bwamerge.sh

echo "#!/bin/bash" > ${mergepath}
echo "#PBS -A trf-262-ab" > ${mergepath} 
echo "#PBS -d /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE" >> ${mergepath}
echo "#PBS -j oe" >> ${mergepath}
echo "#PBS -q courte" >> ${mergepath}
echo "#PBS -o /RQexec/GROUP/hussinju/COMMUN/hussinju_group/lab_projects/PGX_DENOVO/results/2017.07.11/OXFORD_PIPELINE/log/${name}.merge.out" >> ${mergepath}
echo "#PBS -l nodes=1:m48G:ppn=12" >> ${mergepath} #high memory node for sort
echo "#PBS -l mem=40G" >> ${mergepath} #making sure we set enough memory
echo "#PBS -l walltime=48:0:0" >> ${mergepath}
echo "#PBS -V" >> ${mergepath}

echo "${SOFTWARE}/samtools merge -f $outputpath/${assembly}/${name}_${assembly}.bam ${alloutnames}" >> ${mergepath}

#this is to put the original header from the bam back
#echo "${SOFTWARE}/samtools view -H $bam >  $outputpath/${assembly}/${name}_original_headers.txt" >> ${mergepath}
#echo "${SOFTWARE}/samtools view -H $outputpath/${assembly}/${name}_${assembly}.bam > $outputpath/${assembly}/${name}_new_headers.txt" >> ${mergepath}
#echo "cat $outputpath/${assembly}/${name}_original_headers.txt $outputpath/${assembly}/${name}_new_headers.txt | sort -n | uniq >  $outputpath/${assembly}/${name}_reheader.sam" >> ${mergepath}
#echo "${SOFTWARE}/samtools reheader $outputpath/${assembly}/${name}_reheader.sam $outputpath/${assembly}/${name}_${assembly}.bam | samtools view -b -o $outputpath/${assembly}/${name}_${assembly}.headersfixed.bam " >> ${mergepath}
#echo "mv $outputpath/${assembly}/${name}_${assembly}.headersfixed.bam $outputpath/${assembly}/${name}_${assembly}.bam" >> ${mergepath}

echo "${SOFTWARE}/samtools sort -m 24G $outputpath/${assembly}/${name}_${assembly}.bam -o $outputpath/${assembly}/${name}_${assembly}.sorted.bam" >> ${mergepath} #uses same amount of memory as for the namesorted sort in the beginning
echo "${SOFTWARE}/samtools index $outputpath/${assembly}/${name}_${assembly}.sorted.bam" >> ${mergepath}

dedup=$outputpath/${assembly}/${name}_${assembly}.rmdup.bam

echo "${JAVA_PATH}/java -Xmx4g -jar ${SOFTWARE}/picard MarkDuplicates MAX_FILE_HANDLES=1024 REMOVE_DUPLICATES=true I=$outputpath/${assembly}/${name}_${assembly}.sorted.bam O=$outputpath/${assembly}/${name}_${assembly}.rmdup.bam M=$outputpath/${assembly}/${name}_${assembly}.rmdup.metrics VALIDATION_STRINGENCY=SILENT" >> ${mergepath}

echo "echo $bam" >> ${mergepath}
echo "wc -l ${fastqpath}/${name}_1.${fq}" >> ${mergepath}
echo "echo $outputpath/${assembly}/${name}_${assembly}.sorted.bam" >> ${mergepath}
echo "${SOFTWARE}/samtools view -c $outputpath/${assembly}/${name}_${assembly}.sorted.bam" >> ${mergepath}
echo "echo $outputpath/${assembly}/${name}_${assembly}.rmdup.bam" >> ${mergepath}
echo "${SOFTWARE}/samtools view -c $outputpath/${assembly}/${name}_${assembly}.rmdup.bam" >> ${mergepath}
echo "merge script written in ${mergepath}"



if $boolclean; then

#write clean script
cleanpath=${scriptpath}/${name}_${assembly}.bwaclean.sh
#REMOVED for now - may be useful to keep the split fastq files for later analysis
#echo "rm ${fastqpath}/${name}*split*.${fq}" > $outputpath/${assembly}/clean_$name.sh
echo "rm ${fastqpath}/${name}*split*.${fq}" > ${scriptpath}/clean_$name.sh

#echo "rm $outputpath/${assembly}/${name}_original_headers.txt" > ${cleanpath}
#echo "rm $outputpath/${assembly}/${name}_new_headers.txt" > ${cleanpath}
#echo "rm $outputpath/${assembly}/${name}_reheader.sam" > ${cleanpath}
echo "rm $outputpath/${assembly}/${name}*split*" >> ${cleanpath}
echo "rm $outputpath/${assembly}/${name}_${assembly}.bam" >> ${cleanpath}
echo "gzip ${fastqpath}/${name}_1.${fq}" >> ${cleanpath}
echo "gzip ${fastqpath}/${name}_2.${fq}" >> ${cleanpath}

echo "clean script written in ${cleanpath}"

fi

