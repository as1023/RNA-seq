#!/bin/bash
#script for counting  
#SBATCH --job-name=splice_ana
#SBATCH --output=splice_ana-%j.out
#SBATCH --error=splice_ana-%j.err
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --mem=5G
#SBATCH -p long

module load R/3.3.0  
Rscript alternativesplice.r 





