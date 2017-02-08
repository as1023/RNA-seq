#!/bin/bash
###script for cufflink 
#SBATCH --job-name=cufmerg
#SBATCH --output=cuffmerg-%j.out
#SBATCH --error=cufmerg-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=50G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "working directory = "$SLURM_SUBMIT_DIR

gtf=/genomes/mus_musculus/GRCm38_79/GRCm38.79.gtf
ref=/genomes/mus_musculus/GRCm38_79/GRCm38.dna.primary_assembly.fa
out=/home/as1023/script/script_mouse

cuffmerge -o ${out}/merged_asm --ref-gtf ${gtf} -s ${ref} -p 8 assemblies.txt 

