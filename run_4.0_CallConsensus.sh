for i in $(cat file_lists/psmc_samples); do
	echo $i
	qsub 4.0_CallConsensus.sh $i
done
