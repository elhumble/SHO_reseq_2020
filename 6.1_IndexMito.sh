#!/bin/sh
# Grid Engine options
#$ -N IndexMito
#$ -cwd
#$ -l h_rt=4:00:00
#$ -l h_vmem=4G
#$ -pe sharedmem 4
#$ -R y

# Jobscript to index reference

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load samtools
module add roslin/samtools/1.9
module add roslin/bwa/0.7.17

REFERENCE="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/Hassanin.fasta"

# index ref with both bwa and samtools for mapping and SNP calling with samtools

samtools faidx $REFERENCE
bwa index $REFERENCE


