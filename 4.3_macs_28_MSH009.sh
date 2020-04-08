#!/bin/sh 
# Grid Engine Options 
#$ -N Macs 
#$ -cwd 
#$ -l h_rt=1:00:00
#$ -l h_vmem=1G 
#$ -t 1-1000 
#$ -R y 

# Jobscript to sim chr with macs
# Sample MSH009
. /etc/profile.d/modules.sh 

/exports/cmvm/eddie/eb/groups/ogden_grp/software/macs-master/macs 2 2500000 -t 0.0036269549485 -r 0.00329723177136364 -s $SGE_TASK_ID -eN 0 0.0435074265935564 -eN 0.00519389556735212 0.490484054238315 -eN 0.00860331093798255 0.210302016746983 -eN 0.0127026507315879 0.196214039728925 -eN 0.0176315314107906 0.233434063852971 -eN 0.0235577724298276 0.269746930593836 -eN 0.0306832232989342 0.293925052297903 -eN 0.0392506395203161 0.336118825496903 -eN 0.0495518404782854 0.448214063037182 -eN 0.0619374989074254 0.61282233863402 -eN 0.0768296108103698 0.664112625500399 -eN 0.0947352473297477 0.539282455291848 -eN 0.116264385565196 0.381492777353697 -eN 0.142150070216126 0.283523975456405 -eN 0.173274052665008 0.251325482335254 -eN 0.210696275923153 0.275387528916807 -eN 0.255691352053749 0.357369430054833 -eN 0.309791682448299 0.502711566140094 -eN 0.374839668323495 0.696222547242924 -eN 0.453050992640418 0.894015255254555 -eN 0.547089206528643 1.04495114006515 -eN 0.660157097655772 1.11918421098635 -eN 0.796105423248821 1.12300676522175 -eN 0.959564485207997 1.08986242300991 -eN 1.15610134430375 1.05875755333221 -eN 1.39240943285182 1.04942236310769 -eN 1.67653720871962 1.0604157027731 -eN 2.4289168070018 1 > /exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc/macs/macs_28_sim_${SGE_TASK_ID}_MSH009.txt