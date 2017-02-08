#!/bin/bash 
#SBATCH --job-name=cuff_difplain
#SBATCH --output=cuff_dif-%j.out
#SBATCH --error=cuff_dif-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=10G
#SBATCH -p long

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "working directory = "$SLURM_SUBMIT_DIR

index=/prj/leo_kurian_killifish/Amit/final
out=/prj/leo_kurian_killifish/Amit/final
cuffdiff -p 20 -C contrast.txt --min-reps-for-js-test 2 --dispersion-method per-condition --output-dir ${out}/cuffdiff_cpm --library-type fr-firststrand --use-sample-sheet ${index}/cuffcmp.combined.gtf sample.txt
~                                                                                                                                  
~                       