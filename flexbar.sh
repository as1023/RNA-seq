#!/bin/bash
#SBATCH --job-name=trimmed
#SBATCH --output=trimmed-%j.out
#SBATCH --error=trimmed-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=100G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
mkdir -p ${name}"_trimed"
flexbar -r ${name} -p ${name} -t ${trimed}/$(name) - 10 -z BZ2 -m 30 -u 0 -q 28 -a /biosw/flexbar/Adapter.fa -f sanger
echo {name}




