#!/bin/sh
# Grid Engine options
#$ -N MergeSam
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=8G
#S -pe sharedmem 4
#$ -R y
#$ -t 1-20

# Jobscript to index reference

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load java
module add java
# Specifiy some variables

SCRATCH=/exports/eddie/scratch/ehumble
TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/out
DIR=$(ls ${TARGET_DIR})

THIS_DIR=$(echo "${DIR}" | sed -n ${SGE_TASK_ID}p)
echo Working in directory: ${THIS_DIR} on $HOSTNAME

# Need to make this into array job

cd $TARGET_DIR/$THIS_DIR
file=$(ls)

bamlist=$(for f in $file; do echo -n "I=$f " ; done)
#echo $bamlist

java -Xmx4g -jar /exports/cmvm/eddie/eb/groups/ogden_grp/software/picard/picard.jar MergeSamFiles \
       $bamlist \
       O=${THIS_DIR}_merged.bam \
       TMP_DIR=$SCRATCH

