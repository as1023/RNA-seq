#!/bin/bash
#script for counting  
#SBATCH --job-name=top_htseq_count
#SBATCH --output=top_htseq_count-%j.out
#SBATCH --error=top_htseq_count-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=100G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
index=/genomes/new/homo_sapiens/GRCh38_79
dir=/prj/data1
out=/prj/data1/human/
samtools sort -n ${dir}/mapping/${name}/Aligned.out.bam -o ${dir}/mapping/${name}/accepted_hits.sorted.bam
samtools view ${dir}/mapping/${name}/accepted_hits.sorted.bam | htseq-count --mode=intersection-nonempty \
--stranded=reverse --type=exon --idattr=gene_id - ${index}/GRCh38.79.gtf \
> ${out}/htseq-count/${name}.htseq_count.txt

