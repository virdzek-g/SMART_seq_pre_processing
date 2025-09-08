#! /bin/bash
#$ -e /err/
#$ -o /out/
#$ -pe smp 1 -R y -binding linear:1
#$ -l h_vmem=40G
#$ -l h_rt=72:00:00
#$ -N GV_run_transcript_analysis

source /broad/software/scripts/useuse
reuse Anaconda3

./cogent run_transcript_analysis \
-g hg38 \
-t SMARTSeq_FLA \
-o ./output_run_transcript \
-i ./analyze_output/name
