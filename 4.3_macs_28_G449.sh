#!/bin/sh 
# Grid Engine Options 
#$ -N Macs 
#$ -cwd 
#$ -l h_rt=1:00:00
#$ -l h_vmem=1G 
#$ -t 1-1000 
#$ -R y 

# Jobscript to sim chr with macs
# Sample G449
. /etc/profile.d/modules.sh 

/exports/cmvm/eddie/eb/groups/ogden_grp/software/macs-master/macs 2 2500000 -t 0.00358842934788 -r 0.00326220849807273 -s $SGE_TASK_ID -eN 0 0.0138968446987709 -eN 0.0037248597308727 0.833772894081807 -eN 0.00618666481565695 0.224380652364157 -eN 0.00916063304532401 0.161104825751005 -eN 0.0127533164104337 0.189097833864526 -eN 0.0170934044155664 0.236780255089033 -eN 0.0223363461976346 0.281634750804573 -eN 0.0286699457217349 0.311482120348933 -eN 0.0363212544137175 0.320871832064981 -eN 0.0455642746907073 0.381884118141993 -eN 0.0567300961854712 0.555871355256987 -eN 0.0702188159462758 0.729329238190569 -eN 0.0865136480612079 0.690694329747434 -eN 0.106198357964088 0.49791972240044 -eN 0.129978183601568 0.339063516663304 -eN 0.158705054359355 0.263820458111931 -eN 0.193407999735323 0.25805075702189 -eN 0.235330369555388 0.316149973305239 -eN 0.285974027911756 0.440651352156113 -eN 0.347153277876563 0.621303521697359 -eN 0.421059895517421 0.828015842999777 -eN 0.510341543729132 1.01791711455263 -eN 0.618196890563159 1.14998449563121 -eN 0.748489783658914 1.2014413224513 -eN 0.905887994882909 1.18730996606554 -eN 1.09603042748594 1.14115527657783 -eN 1.32572894860269 1.07417478159275 -eN 1.93842211260324 1 > /exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc/macs/macs_28_sim_${SGE_TASK_ID}_G449.txt