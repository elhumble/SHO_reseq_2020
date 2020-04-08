#!/bin/sh
# Grid Engine options
#$ -N CatVariants
#$ -cwd
#$ -l h_rt=8:00:00
#$ -l h_vmem=12G
#S -pe sharedmem 2
#$ -R y

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
#CHR="HiC_scaffold_${SGE_TASK_ID}"

# Run process

java -Xmx8G -cp /exports/cmvm/eddie/eb/groups/ogden_grp/software/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar \
	org.broadinstitute.gatk.tools.CatVariants \
	-R $REFERENCE \
	-V HiC_scaffold_1_focal.vcf.gz \
	-V HiC_scaffold_2_focal.vcf.gz \
	-V HiC_scaffold_3_focal.vcf.gz \
	-V HiC_scaffold_4_focal.vcf.gz \
	-V HiC_scaffold_5_focal.vcf.gz \
	-V HiC_scaffold_6_focal.vcf.gz \
	-V HiC_scaffold_7_focal.vcf.gz \
	-V HiC_scaffold_8_focal.vcf.gz \
	-V HiC_scaffold_9_focal.vcf.gz \
	-V HiC_scaffold_10_focal.vcf.gz \
	-V HiC_scaffold_11_focal.vcf.gz \
	-V HiC_scaffold_12_focal.vcf.gz \
	-V HiC_scaffold_13_focal.vcf.gz \
	-V HiC_scaffold_14_focal.vcf.gz \
	-V HiC_scaffold_15_focal.vcf.gz \
	-V HiC_scaffold_16_focal.vcf.gz \
	-V HiC_scaffold_17_focal.vcf.gz \
	-V HiC_scaffold_18_focal.vcf.gz \
	-V HiC_scaffold_19_focal.vcf.gz \
	-V HiC_scaffold_20_focal.vcf.gz \
	-V HiC_scaffold_21_focal.vcf.gz \
	-V HiC_scaffold_22_focal.vcf.gz \
	-V HiC_scaffold_23_focal.vcf.gz \
	-V HiC_scaffold_24_focal.vcf.gz \
	-V HiC_scaffold_25_focal.vcf.gz \
	-V HiC_scaffold_26_focal.vcf.gz \
	-V HiC_scaffold_27_focal.vcf.gz \
	-V HiC_scaffold_28_focal.vcf.gz \
	-V HiC_scaffold_29_focal.vcf.gz \
	-out $OUTPUT_DIR/ORYX_geno_focal.vcf.gz \
	-assumeSorted










