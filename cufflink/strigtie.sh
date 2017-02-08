#!/bin/bash
###script for cufflink 
#SBATCH --job-name=strigtie
#SBATCH --output=stringtie-%j.out
#SBATCH --error=stringtie-%j.err
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --mem=50G

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
#echo "working directory = "$SLURM_SUBMIT_DIR

name=$1
out=/prj/leo_kurian_killifish/Amit/final
dir=/prj/leo_kurian_killifish/workflow
genome=/prj/leo_kurian_killifish/killifish_annotation

#mkdir -p "${out}/cufflink/"${name}
stringtie -p 10 -o ${out}/strigtie/${name}_strigtie/primrary.gtf -G ${genome}/NotFur1_protein_coding_gene_models_15-07-2014.gtf /${dir}/mapping/${name}/Aligned.noS.bam
echo ${name}


