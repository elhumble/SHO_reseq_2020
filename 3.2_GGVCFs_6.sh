#!/bin/sh
# Grid Engine options
#$ -N GenoGVCFs
#$ -cwd
#$ -l h_rt=8:00:00
#$ -l h_vmem=12G
#S -pe sharedmem 2
#$ -R y
#$ -t 1-29

# Jobscript to run Haplotype Caller
# Test run on one chr

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load java
module add java 

OUTPUT_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/hapruns_v3
REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/reference/oryx_v2_chr.fasta
CHR="HiC_scaffold_${SGE_TASK_ID}"

# Run process

java -Xmx8G -jar /exports/cmvm/eddie/eb/groups/ogden_grp/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar \
	-T GenotypeGVCFs \
	-nt 2 \
	-R $REFERENCE \
	-L $CHR \
	-V G449_${CHR}.g.vcf.gz \
	-V MSH005_${CHR}.g.vcf.gz \
	-V MSH009_${CHR}.g.vcf.gz \
	-V G445_${CHR}.g.vcf.gz \
	-V MSH638_${CHR}.g.vcf.gz \
	-V MSH645_${CHR}.g.vcf.gz \
	-o $OUTPUT_DIR/${CHR}_focal.vcf.gz

