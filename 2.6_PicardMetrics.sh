#!/bin/sh
# Grid Engine options
#$ -N PicardMetrics
#$ -cwd
#$ -l h_rt=6:00:00
#$ -l h_vmem=8G
#S -pe sharedmem 4
#$ -t 1-20
#$ -R y

# Jobscript to index reference

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load java
module add java 

# Specifiy some paths

TMPDIR=/exports/eddie/scratch/ehumble
OUTPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp_emily/SHO_reseq_2020/data/out
TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/out
PICARD_PATH=/exports/cmvm/eddie/eb/groups/ogden_grp/software/picard
REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/reference/oryx_v2_chr.fasta

# Get list of files in target directory

bam=$(ls -1 ${TARGET_DIR}/*rmdup.bam)

# Get file to be processed by *this* task
# extract the Nth file in the list of files, $files, where N == $SGE_TASK_ID

this_bam=$(echo "${bam}" | sed -n ${SGE_TASK_ID}p)
echo Processing file: ${this_bam} on $HOSTNAME

# Run Picard

java -Xmx4g -jar $PICARD_PATH/picard.jar CollectAlignmentSummaryMetrics \
	TMP_DIR=$TMPDIR \
	VALIDATION_STRINGENCY=LENIENT \
	MAX_INSERT_SIZE=5000 \
	REFERENCE_SEQUENCE=$REFERENCE \
	INPUT=$this_bam \
	OUTPUT=${this_bam%.bam}_CollectAlignmentSummary.metrics

java -Xmx4g -jar $PICARD_PATH/picard.jar CollectGcBiasMetrics \
	TMP_DIR=$TMPDIR \
	VALIDATION_STRINGENCY=LENIENT \
	REFERENCE_SEQUENCE=$REFERENCE \
	INPUT=$this_bam \
	OUTPUT=${this_bam%.bam}_CollectGCBias.metrics \
	CHART_OUTPUT=${this_bam%.bam}_CollectGCBias.pdf \
	SUMMARY_OUTPUT=${this_bam%.bam}_CollectGCBias.summary

java -Xmx4g -jar $PICARD_PATH/picard.jar CollectInsertSizeMetrics \
	TMP_DIR=$TMPDIR \
	VALIDATION_STRINGENCY=LENIENT \
	REFERENCE_SEQUENCE=$REFERENCE \
	INPUT=$this_bam \
	OUTPUT=${this_bam%.bam}_CollectInsertSize.metrics \
	HISTOGRAM_FILE=${this_bam%.bam}_CollectInsertSize.pdf \
	MINIMUM_PCT=0


