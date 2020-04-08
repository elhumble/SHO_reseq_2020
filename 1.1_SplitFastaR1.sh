#!/bin/sh
# Grid Engine options
#$ -N splitfaR1
#$ -cwd
#$ -t 1-20
#$ -l h_rt=4:00:00
#$ -l h_vmem=4G
#S -pe sharedmem 4
#$ -R y

# Jobscript to split fasta files

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Target directory
TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/raw/r1

# Get list of files in target directory

r1s=$(ls -1 ${TARGET_DIR})

# Get file to be processed by *this* task
# Extract the Nth files in the list of files, $r1s, where N == $SGE_TASK_ID

this_r1=$(echo "${r1s}" | sed -n ${SGE_TASK_ID}p)
echo Processing file: ${this_r1} on $HOSTNAME

# Process files
# Split fasta into pieces

~/programs/slicer/slicer -i ${TARGET_DIR}/${this_r1} -l 50000000 -o /exports/eddie/scratch/ehumble -e ${this_r1} -z -s

