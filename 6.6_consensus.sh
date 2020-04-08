#!/bin/sh
# Grid Engine options
#$ -N consensus
#$ -cwd
#$ -l h_rt=0:30:00
#$ -l h_vmem=4G
#$ -pe sharedmem 4
#$ -t 1-20
#$ -R y

# Jobscript to build consensus for PSMC

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Load Dependencies and setup env variables #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Initialise the Modules environment
. /etc/profile.d/modules.sh

# Load java
module add roslin/samtools/1.9
module add roslin/bcftools/1.9
module add igmm/apps/tabix/0.2.6

# Paths
REFERENCE=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/Hassanin.fasta
TARGETDIR=/exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/mito/mapped

bam=$(ls -1 ${TARGETDIR}/*mito_mapped_Hass.bam)
this_bam=$(echo "${bam}" | sed -n ${SGE_TASK_ID}p)
echo Processing file: ${this_bam} on $HOSTNAME

base=$(basename ${this_bam} | cut -f 1 -d '_')
echo $base


#~~ Prepare

# bgzip $TARGETDIR/SHO_mito_q.recode.vcf # I think this needs to be in previous script
# bcftools index $TARGETDIR/SHO_mito_hass.vcf.gz

#~~ Call consensus

bcftools consensus -f $REFERENCE $TARGETDIR/SHO_mito_hass_Q.recode.vcf.gz -s $base > $TARGETDIR/consensus_hass_${base}.fa
cat $TARGETDIR/consensus_hass_*.fa > $TARGETDIR/SHO_mito_hass.fa
