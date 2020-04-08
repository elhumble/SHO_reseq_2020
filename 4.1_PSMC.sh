#!/bin/sh
# Grid Engine options
#$ -N PSMC
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=4G
#$ -t 1
#$ -pe sharedmem 4
#$ -R y

# Jobscript to run PSMC using consensus seqs

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc
PSMC_HOME=/exports/cmvm/eddie/eb/groups/ogden_grp/software/psmc-master/
SAMPLE_SHEET="/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/file_lists/psmc_basenames"

# Get list of samples to work on
SAMPLE=`sed -n "$SGE_TASK_ID"p $SAMPLE_SHEET | awk '{print $1}'`
echo Processing ${SAMPLE}

# Run process

# cat all consensus seqs together

cat $TARGET_DIR/${SAMPLE}_HiC_scaffold_*.fq > $TARGET_DIR/${SAMPLE}_consensus.fq

# prepare for psmc using fq2psmcfa

$PSMC_HOME/utils/fq2psmcfa $TARGET_DIR/${SAMPLE}_consensus.fq > $TARGET_DIR/${SAMPLE}.psmcfa

# psmc

$PSMC_HOME/psmc -p "4+25*2+4+6" -o $TARGET_DIR/${SAMPLE}.psmc $TARGET_DIR/${SAMPLE}.psmcfa

# plot: am doing this manually

#PSMC_HOME/utils/psmc_plot.pl -u 2.2e-9 -g 8 -p ${SAMPLE}_plot ${SAMPLE}.psmc

