#! /bin/bash
#$ -e /SMART_seq/err
#$ -o /SMART_seq/out
#$ -pe smp 3 -R y -binding linear:3
#$ -l h_vmem=20G
#$ -l h_rt=72:00:00
#$ -N GV_Bcl2Fastq_and_Takara_bio

source /broad/software/scripts/useuse
reuse -q .bcl2fastq2-v2.20.0
reuse Anaconda3
#reuse .anaconda3-2022.05


/broad/software/free/Linux/redhat_7_x86_64/pkgs/bcl2fastq2_v2.20.0/bin/bcl2fastq -R ./BCL_data/file/ \
 -o /./FASTQ_output/name \
 --no-lane-splitting \
 --sample-sheet ./SampleSheet.csv \
 2> ./FASTQ_output/name.stderr

./cogent demux \
-i ./FASTQ_output/name/Undetermined_S0_R1_001.fastq.gz \
-b ./well_sheets/well_sheet.txt \
-t SMARTSeq_FLA \
-o ./demux_output/name \
-p ./FASTQ_output/name/Undetermined_S0_R2_001.fastq.gz

./cogent analyze \
-i ./demux_output/name \
-g hg38 \
-o ./analyze_output/name \
-t SMARTSeq_FLA
