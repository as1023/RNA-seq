#!/bin/bash 
#SBATCH --job-name=cuff_norm
#SBATCH --output=cuff_norm-%j.out
#SBATCH --error=cuff_norm-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=10G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "working directory = "$SLURM_SUBMIT_DIR

index=/genomes/new/mus_musculus/GRCm38_79
out=/home/as1023/Result

cuffnorm -p 20 --output-dir ${out}/cuffnorm --library-type fr-firststrand --use-sample-sheet ${index}/GRCm38.79.gtf sample_sheet.txt 





