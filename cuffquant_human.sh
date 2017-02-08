#!/bin/bash
#script for counting  
#SBATCH --job-name=cuff_quant
#SBATCH --output=cuff_quant-%j.out
#SBATCH --error=cuff_quant-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=10G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
#echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
index=/genomes/new/homo_sapiens/GRCh38_79
out=/home/as1023/Result/LongRNA/human/hum_qunat

input= /prj/data
cuffquant -p 10 --library-type fr-firststrand -o ${out}/${name}_qunat_out ${index}/GRCh38.79.gtf ${input}/mapping/${name}/Aligned.noS.bam

echo ${name}

