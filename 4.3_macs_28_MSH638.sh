#!/bin/sh 
# Grid Engine Options 
#$ -N Macs 
#$ -cwd 
#$ -l h_rt=1:00:00
#$ -l h_vmem=1G 
#$ -t 1-1000 
#$ -R y 

# Jobscript to sim chr with macs
# Sample MSH638
. /etc/profile.d/modules.sh 

/exports/cmvm/eddie/eb/groups/ogden_grp/software/macs-master/macs 2 2500000 -t 0.00389856594084 -r 0.00354415085530909 -s $SGE_TASK_ID -eN 0 0.085526433911788 -eN 0.005802897659883 0.223614143148792 -eN 0.00960029382161374 0.171746231912069 -eN 0.0141564035051588 0.202254515843871 -eN 0.0196229166072581 0.250986974471739 -eN 0.0261817553887539 0.277949490564862 -eN 0.0340511473512224 0.300255958548128 -eN 0.0434927542660638 0.37717765434876 -eN 0.054821045527564 0.539203059039978 -eN 0.0684129355440717 0.650010878370314 -eN 0.084720589586548 0.563882965633855 -eN 0.104286605980146 0.392587446783118 -eN 0.127762234734108 0.274617593598871 -eN 0.155928632609974 0.229264030721363 -eN 0.189723002894914 0.242759018749875 -eN 0.230269883918283 0.313524665912574 -eN 0.278918378425762 0.445088785456358 -eN 0.337287568135035 0.62225017505727 -eN 0.407319585396791 0.801930488269843 -eN 0.491344962628045 0.93991944725205 -eN 0.592159467403438 1.01361987805664 -eN 0.713118100023975 1.02886887127931 -eN 0.858245593467908 1.01326949947879 -eN 1.03237133686722 0.997898256609138 -eN 1.24128964664307 1.00511151385725 -eN 1.49195225029123 1.03804894844181 -eN 1.7927002438656 1.07913829577127 -eN 2.58648291198131 1 > /exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc/macs/macs_28_sim_${SGE_TASK_ID}_MSH638.txt