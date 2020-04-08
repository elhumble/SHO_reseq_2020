#!/bin/sh
#$ -N angsdHet
#$ -cwd
#$ -l h_rt=8:00:00
#$ -l h_vmem=8G
#$ -pe sharedmem 4
#$ -R y
#$ -t 1-29

# Script to calculate single-sample SFS using ANGSD for list of samples to calculate genome-wide heterozygosity

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

SOFTWARE_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/software/angsd/
OUTPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/angsd
REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/reference/oryx_v2_chr.fasta
#SAMPLE_SHEET="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/angsd/bam_full.filelist"
AUTO=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/angsd/auto.rf

#file=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $1}'`
#base=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $1}' | cut -f 12 -d '/' | cut -f 1 -d '.' | cut -f 1 -d '_'`

#echo Processing ${file} and ${base}

SAMPLE=`echo $1`
base=`echo $1 | awk '{print $1}' | cut -f 12 -d '/' | cut -f 1 -d '.' | cut -f 1 -d '_'`
CHR="HiC_scaffold_${SGE_TASK_ID}"

# Run process

$SOFTWARE_DIR/angsd \
       -P 4 \
       -uniqueOnly 1 \
       -remove_bads 1 \
       -only_proper_pairs 1 \
       -baq 1 \
       -minMapQ 20 \
       -minQ 20 \
       -ref $REFERENCE \
       -r $CHR \
       -i $SAMPLE \
       -anc $REFERENCE \
       -doSaf 1 \
       -GL 1 \
       -fold 1 \
       -out $OUTPUT_DIR/${base}_${SGE_TASK_ID}


# -rf $AUTO for all autosomes
# -downSample 0.25
