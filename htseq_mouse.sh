#!/bin/bash
#script for counting  
#SBATCH --job-name=htseq_count
#SBATCH --output=htseq_count-%j.out
#SBATCH --error=htseq_count-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=10G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
index=/genomes/new/mus_musculus/GRCm38_79
dir=/prj/data

htseq-count -f bam -m intersection-nonempty \
-r pos \
--type=exon --idattr=gene_id \
--stranded=reverse \
${dir}/mapping/${name}/Aligned.noS.bam \
${index}/GRCm38.79.gtf > /data/as1023/count_data/mouse/${name}.htseq_count.txt

echo ${name}



