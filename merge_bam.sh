#! /bin/bash
#$ -e /err/
#$ -o /out/
#$ -pe smp 1 -R y -binding linear:1
#$ -l h_vmem=40G
#$ -l h_rt=72:00:00
#$ -N GV_merge_bam_Takara

source /broad/software/scripts/useuse
reuse Anaconda3

./cogent merge_bam \
-f ./well_sheet_mergeBAM.txt \
-c Sample \
-o ./output_merge_bam \
-i ./analyze_output/name
