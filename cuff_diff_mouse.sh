#!/bin/bash 
#SBATCH --job-name=cuff_dif
#SBATCH --output=cuff_dif-%j.out
#SBATCH --error=cuff_dif-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=10G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "working directory = "$SLURM_SUBMIT_DIR

index=/biodb/genomes/new/mus_musculus/GRCm38_79
out=/home/as1023/Result/LongRNA/mouse
cuffdiff -p 20 -C contrasts.txt --min-reps-for-js-test 2 --dispersion-method per-condition --output-dir ${out}/cuffdiff --library-type fr-firststrand --use-sample-sheet ${index}/GRCm38.79.gtf sample_sheet.txt 
