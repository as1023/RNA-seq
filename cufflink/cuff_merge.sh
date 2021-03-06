#!/bin/bash
###script for cufflink 
#SBATCH --job-name=cufmerge
#SBATCH --output=cuff_merge-%j.out
#SBATCH --error=cuf_mrge-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=50G
echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
#echo "working directory = "$SLURM_SUBMIT_DIR

#ls ./cufflink/*/transcripts.gtf > assembly_GTF_list.txt

genome=/prj/genome
cuffmerge -p10 -g ${genome}/GRC39.gtf \
-s ${genome}/NotFur1_genome_draft.fa \
gtf_out_list.txt --keep-tmp > cuffmerge.stdout 2> cuffmerge.stderr

cuffcompare -V \
-r ${genome}/GRC39.gtf \
-C merged_asm/merged.gtf > cuffcompare.stdout 2> cuffcompare.stderr


