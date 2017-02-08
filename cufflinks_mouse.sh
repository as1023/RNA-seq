#!/bin/bash

###script for cufflink 
#SBATCH --job-name=cufflink
#SBATCH --output=cuff_link-%j.out
#SBATCH --error=cufflink-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=50G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
#echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
out=/home/as1023/Result/LongRNA/mouse
dir=/prj/data
#mkdir -p "${out}/cufflink/"${name}

cufflinks -p 10 -o ${out}/cufflink/${name} \
	-u --library-type fr-unstranded --max-bundle-frags 1000000000000 \
	${dir}/mapping/${name}/Aligned.noS.bam

echo ${name}





