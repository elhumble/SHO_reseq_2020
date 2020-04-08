#!/bin/sh 
# Grid Engine Options 
#$ -N Macs 
#$ -cwd 
#$ -l h_rt=1:00:00
#$ -l h_vmem=1G 
#$ -t 1-1000 
#$ -R y 

# Jobscript to sim chr with macs
# Sample MSH005
. /etc/profile.d/modules.sh 

/exports/cmvm/eddie/eb/groups/ogden_grp/software/macs-master/macs 2 2500000 -t 0.0037248494099 -r 0.00338622673627273 -s $SGE_TASK_ID -eN 0 0.0780386661343724 -eN 0.00596952088610663 0.235380651247197 -eN 0.00987376891056312 0.184550539002449 -eN 0.0145561705745456 0.209162251909914 -eN 0.0201720842862255 0.256453569213056 -eN 0.0269073682639671 0.283772957234364 -eN 0.0349854608494088 0.303730181250568 -eN 0.0446736438613413 0.38962145923074 -eN 0.0562932545857282 0.561170364859426 -eN 0.0702290808065239 0.695093942138592 -eN 0.0869428406325007 0.615293911965566 -eN 0.106988432402345 0.427786797612518 -eN 0.131029771627225 0.295355532474945 -eN 0.159863665848437 0.242509981879845 -eN 0.194445412692387 0.251791455369247 -eN 0.235920661279456 0.318195533193869 -eN 0.285663673146606 0.446385963115926 -eN 0.345322391163334 0.626966897357791 -eN 0.416873720437651 0.823498687691203 -eN 0.502688068093005 0.989228392926876 -eN 0.605608860630573 1.08504708680518 -eN 0.729046085757841 1.09937954671836 -eN 0.877089305078164 1.05835049401523 -eN 1.05464381395769 1.01095896305002 -eN 1.26759212712757 0.993606477288262 -eN 1.52298991273242 1.01256456020091 -eN 1.82929909802258 1.05409413657488 -eN 2.6372695698492 1 > /exports/cmvm/eddie/eb/groups/ogden_grp/emily/SHO_reseq_2020/data/psmc/macs/macs_28_sim_${SGE_TASK_ID}_MSH005.txt
