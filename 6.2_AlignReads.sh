#!/bin/sh
# Grid Engine options
#$ -N bwa_mem
#$ -cwd
#$ -l h_rt=8:00:00
#$ -l h_vmem=4G
#$ -t 1-20
#$ -pe sharedmem 4
#$ -R y

# Jobscript to run BWA against Hassanin mitogenome

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load bwa & samtools
module load roslin/bwa/0.7.17
module load roslin/samtools/1.9 

OUTPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/mapped
TARGET_DIR=/exports/eddie/scratch/ehumble
SAMPLE_SHEET="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/file_lists/sample_path.txt"
REFERENCE="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/Hassanin.fasta"

# Get list of files

base=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $1}'`
r1=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $2}'`
r2=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $3}'`


# Process
echo Processing sample: ${base} on $HOSTNAME
echo Processing $r1
echo Processing $r2


bwa mem -t 4 $REFERENCE $TARGET_DIR/$r1 $TARGET_DIR/$r2 | samtools view -b -f3 -F3840 > $OUTPUT_DIR/${base}_mito_mapped_Hass.bam
