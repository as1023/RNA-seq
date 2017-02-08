#!/bin/bash
#BATCH --job-name=cuff_cpm
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
index=/prj/data/as1023/final
out=/prj/data/workflow
put=/prj/data/as1023/final
cuffquant -p 20 --library-type fr-firststrand -o ${put}/${name}_all ${index}/merged_asm/merged.gtf ${out}/mapping/${name}/Aligned.noS.bam
echo ${name}

