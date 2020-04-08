for i in $(cat data/psmc/psmc_basenames); do
	echo $i
	qsub 4.2_boot_PSMC.sh $i
done
