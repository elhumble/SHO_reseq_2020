#!/bin/sh
# Grid Engine options
#$ -N bcftools_focal
#$ -cwd
#$ -l h_rt=3:00:00 #6:00:00
#$ -l h_vmem=4G  #4G
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
module add java
module add roslin/bcftools/1.9
module add igmm/apps/tabix/0.2.6
module load igmm/apps/vcftools/0.1.13

# Paths

REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/Hassanin.fasta
TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/mapped
OUTPUT=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/mapped


# Run process

#bcftools mpileup -d 50000 -q 30 -Q 30 -a "FORMAT/AD,FORMAT/DP" -f $REFERENCE $TARGET_DIR/*RG_rmdup.bam | 
#bcftools call -vm --ploidy 1 > $OUTPUT/SHO_mito_hass.vcf

# Focal individuals

bcftools mpileup -d 50000 -q 30 -Q 30 -a "FORMAT/AD,FORMAT/DP" -f $REFERENCE \
	$TARGET_DIR/G449_sorted_RG_rmdup.bam \
	$TARGET_DIR/MSH005_sorted_RG_rmdup.bam \
	$TARGET_DIR/MSH009_sorted_RG_rmdup.bam \
	$TARGET_DIR/MSH241_sorted_RG_rmdup.bam \
	$TARGET_DIR/MSH638_sorted_RG_rmdup.bam \
	$TARGET_DIR/MSH645_sorted_RG_rmdup.bam | bcftools call -vm --ploidy 1 > $OUTPUT/SHO_mito_hass_focal.vcf

# Filter
# vcftools --vcf $TARGET_DIR/SHO_mito_hass.vcf --minQ 200 --recode --recode-INFO-all --out $TARGET_DIR/SHO_mito_hass_Q
vcftools --vcf $TARGET_DIR/SHO_mito_hass_focal.vcf --minQ 200 --recode --recode-INFO-all --out $TARGET_DIR/SHO_mito_hass_Q_focal

# Prepare for consensus building
#bgzip $TARGET_DIR/SHO_mito_hass_Q.recode.vcf 
#bcftools index $TARGET_DIR/SHO_mito_hass_Q.recode.vcf.gz

bgzip $TARGET_DIR/SHO_mito_hass_Q_focal.recode.vcf
bcftools index $TARGET_DIR/SHO_mito_hass_Q_focal.recode.vcf.gz
