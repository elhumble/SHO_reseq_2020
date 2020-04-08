for i in $(cat data/angsd/bam_full.filelist); do
	echo $i
	qsub 6.1_realSFS.sh $i
done
