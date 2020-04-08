for i in $(cat file_lists/bam_full.filelist); do
	echo $i
	qsub 6.1_angsdHet.sh $i
done
