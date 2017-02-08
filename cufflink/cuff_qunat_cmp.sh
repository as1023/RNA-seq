#!/bin/bash 
#SBATCH --job-name=cuff_cpm
#SBATCH --output=cuff_quant_cpm-%j.out
#SBATCH --error=cuff_quant_cpm-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=10G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
#echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
index=/prj/final
out=/prj/workflow
put=/prj/data/final_1
cuffquant -p 20 --library-type fr-firststrand -o ${put}/${name}_cmp ${index}/cuffcmp.combined.gtf ${out}/mapping/${name}/Aligned.noS.bam
echo ${name}


