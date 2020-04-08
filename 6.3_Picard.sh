#!/bin/sh
# Grid Engine options
#$ -N picard
#$ -cwd
#$ -l h_rt=3:00:00 #6:00:00
#$ -l h_vmem=4G  #4G
#$ -t 1-20
#$ -pe sharedmem 4
#$ -R y

# Jobscript to build consensus for PSMC

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load java
module add roslin/samtools/1.9
module add java
module add roslin/bcftools/1.9
module add igmm/apps/tabix/0.2.6

# Paths

REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/SHO_mitogenome.fasta
TARGETDIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/mapped
OUTPUT=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/mapped
SCRATCH=/exports/eddie/scratch/ehumble

bam=$(ls -1 ${TARGETDIR}/*mito_mapped_Hass.bam)

# Get file to be processed by *this* task
# Extract the Nth file in the list of files, $bam, where N == $SGE_TASK_ID

this_bam=$(echo "${bam}" | sed -n ${SGE_TASK_ID}p)
echo Processing file: ${this_bam} on $HOSTNAME

#base=$(echo "${this_bam}" | sed -n ${SGE_TASK_ID}p | cut -f 1 -d '_' | cut -f 3 -d '_' | cut -f 5 -d '/')
#echo ${base}
base=$(basename ${this_bam} | cut -f 1 -d '_')
echo $base

# Run process

java -Xmx4g -jar /exports/cmvm/eddie/eb/groups/ogden_grp/software/picard/picard.jar SortSam \
	I=${this_bam} \
	O=$TARGETDIR/${base}_sorted.bam \
	SORT_ORDER=coordinate

java -Xmx4g -jar /exports/cmvm/eddie/eb/groups/ogden_grp/software/picard/picard.jar AddOrReplaceReadGroups \
	I=$TARGETDIR/${base}_sorted.bam \
	O=$TARGETDIR/${base}_sorted_RG.bam \
	RGID=${base} \
	RGLB=lib1 \
	RGPL=illumina \
	RGPU=${base} \
	RGSM=${base} \
	VALIDATION_STRINGENCY=SILENT \
	SORT_ORDER=coordinate \
	TMP_DIR=$SCRATCH


java -Xmx4g -jar /exports/cmvm/eddie/eb/groups/ogden_grp/software/picard/picard.jar MarkDuplicates \
	       I=$TARGETDIR/${base}_sorted_RG.bam \
	       O=$TARGETDIR/${base}_sorted_RG_rmdup.bam \
	       METRICS_FILE=$TARGETDIR/${base}_rmdup.metrics \
	       ASSUME_SORTED=true \
	       REMOVE_DUPLICATES=true \
	       VALIDATION_STRINGENCY=SILENT \
	       TMP_DIR=$SCRATCH \
	       MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 \
	       MAX_RECORDS_IN_RAM=50000

#java -Xmx4g -jar /exports/cmvm/eddie/eb/groups/ogden_grp/software/picard/picard.jar CreateSequenceDictionary \
#	R=$REFERENCE \
#	O=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_2018/data/mito/SHO_mitogenome.dict
