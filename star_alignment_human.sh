#!/bin/bash
#SBATCH --job-name=star_test
#SBATCH --output=star-%j.out
#SBATCH --error=star-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=100G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR
#rm -f -r ${PREFIX}"_starmapping"
name=$1
#mkdir -p "mapping/${name}/"
#mkdir -p "${name}"
#rm -f -r ${name}"_starmapping

out=/home/as1023/Result
index=/genomes/new/homo_sapiens/GRCh38_79
STAR --genomeDir ${index}/star --readFilesIn ${name}_rRNAfree_1.fastq.gz ${name}_rRNAfree_2.fastq.gz --readFilesCommand zcat --outFileNamePrefix ${out}/mapping/${name}/ --outSAMtype BAM Unsorted SortedByCoordinate --runThreadN 10 --outReadsUnmapped Fastx --sjdbGTFfile ${index}/GRCh38.79.gtf --quantMode GeneCounts
echo $name 











