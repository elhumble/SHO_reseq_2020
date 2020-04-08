#!/bin/sh
# Grid Engine options
#$ -N IndexBam
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G
#$ -pe sharedmem 4
#$ -t 1
#$ -R y

# Jobscript to index reference

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load java
module add roslin/samtools/1.9

# Specify some paths

TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/out

# Get list of files in target directory

bam=$(ls -1 ${TARGET_DIR}/*rmdup.bam)

# Get the file to be processed by *this* task
# Extract the Nth file in the list of files, $bam, where N == $SGE_TASK_ID

this_bam=$(echo "${bam}" | sed -n ${SGE_TASK_ID}p)
echo Processing file: ${this_bam} on $HOSTNAME

# index bams

samtools index ${this_bam}
#samtools index /exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_2018/data/out/MSH250_merged_rmdup.bam

