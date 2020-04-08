#!/bin/sh
# Grid Engine options
#$ -N CallCons
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=4G
#$ -t 1-29
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
#igmm/apps/bcftools/1.2
#igmm/apps/samtools/1.2
#module add roslin/bcftools/1.4
module add roslin/bcftools/1.9
module add igmm/apps/tabix/0.2.6

# Paths
REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/reference/oryx_v2_chr.fasta
OUTPATH=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc

# Get list of chromosomes to work on
CHR="HiC_scaffold_${SGE_TASK_ID}"

# Get sample base name
BASE=`basename $1 | cut -f 1 -d "_"`

# Get sample name
SAMPLE=`echo $1`
echo ${BASE}_${CHR}

# Run process

samtools mpileup -Q 30 -q 30 -u -v \
	-f $REFERENCE -r $CHR $SAMPLE |
bcftools call -c |  
vcfutils.pl vcf2fq -d 5 -D 40 -Q 30 > $OUTPATH/${BASE}_${CHR}.fq

