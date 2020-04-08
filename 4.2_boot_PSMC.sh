#!/bin/sh
# Grid Engine options
#$ -N bootPSMC
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=4G
#$ -pe sharedmem 8
#$ -R y
#$ -t 1-100

# Jobscript to index reference

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

SAMPLE=`echo $1`
TARGET_DIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc

# Run process

PSMC_HOME=/exports/cmvm/eddie/eb/groups/ogden_grp/software/psmc-master/

# Split fasta seq

$PSMC_HOME/utils/splitfa $TARGET_DIR/${SAMPLE}.psmcfa > $TARGET_DIR/${SAMPLE}_split.psmcfa

# Run PSMC with bootstrapping

BOOT="seq 1 100"

# Get the boot to be run by this task

this_boot=$(echo "${BOOT}" | sed -n ${SGE_TASK_ID}p)

$PSMC_HOME/psmc -b -p "4+25*2+4+6" -o $TARGET_DIR/${SAMPLE}_boot_${SGE_TASK_ID}.psmc $TARGET_DIR/${SAMPLE}_split.psmcfa

# $PSMC_HOME/utils/psmc_plot.pl -u 2.2e-9 -g 8 -p X_plot X.psmc

