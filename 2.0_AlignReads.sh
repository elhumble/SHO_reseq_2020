#!/bin/sh
# Grid Engine options
#$ -N bwa_mem_split
#$ -cwd
#$ -l h_rt=24:00:00
#$ -l h_vmem=12G
#$ -t 1-478
#S -pe sharedmem 8
#$ -R y

# Jobscript to index reference

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load blast
module load roslin/bwa/0.7.17
module load roslin/samtools/1.9 

OUTPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/out
TARGET_DIR=/exports/eddie/scratch/ehumble
SAMPLE_SHEET="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/file_lists/sample_path.txt"

# Get list of files

base=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $1}'`
r1=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $2}'`
r2=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $3}'`


# Process
echo Processing sample: ${base} on $HOSTNAME

bwa mem -t 8 data/reference/oryx_v2_chr.fasta $TARGET_DIR/$r1 $TARGET_DIR/$r2 | samtools view -bF 4 - > $OUTPUT_DIR/${base}_mapped.bam
