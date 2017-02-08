#!/bin/bash
#BATCH --job-name=cuffcomp
#SBATCH --output=cuff_comp-%j.out
#SBATCH --error=cuff_comp-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=50G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
#echo "working directory = "$SLURM_SUBMIT_DIR

cuffcompare -i gtf_list_tie.txt -r /prj/leo_kurian_killifish/killifish_annotation/NotFur1_protein_coding_gene_models_15-07-2014.gtf -o ./cuffcompare -V -T

