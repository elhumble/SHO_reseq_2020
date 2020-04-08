#!/bin/sh
#$ -N realSFShet
#$ -cwd
#$ -l h_rt=1:00:00
#$ -l h_vmem=12G
#$ -pe sharedmem 4
#$ -R y
#$ -t 1-29

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

SOFTWARE_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/software/angsd/
INPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/angsd
OUTPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/angsd/slidwin

#~~ pre array within an array

#SAMPLE_SHEET="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/angsd/bam_full.filelist"
#base=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $1}' | cut -f 12 -d '/' | cut -f 1 -d '.' | cut -f 1 -d '_'`

#echo Processing ${base}

# Run process

#SOFTWARE_DIR/misc/realSFS $OUTPUT_DIR/${base}.saf.idx > $OUTPUT_DIR/${base}_est.ml

#~~~ post array within an array

SAMPLE=`echo $1`
base=`echo $1 | awk '{print $1}' | cut -f 12 -d '/' | cut -f 1 -d '.' | cut -f 1 -d '_'`
echo Processing ${SAMPLE} and ${base}

$SOFTWARE_DIR/misc/realSFS $INPUT_DIR/${base}_${SGE_TASK_ID}.saf.idx -win 2500000 -step 2500000 > $OUTPUT_DIR/${base}_${SGE_TASK_ID}_est.ml

