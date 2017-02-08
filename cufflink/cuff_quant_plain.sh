#!/bin/bash 
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
index=/prj/leo_kurian_killifish/killifish_annotation
out=/prj/leo_kurian_killifish/workflow
put=/prj/leo_kurian_killifish/Amit/final
cuffquant -p 10 --library-type fr-firststrand -o ${put}/${name}_ref ${index}/NotFur1_protein_coding_gene_models_15-07-2014.gtf ${out}/mapping/${name}/Aligned.noS.bam
echo ${name}


